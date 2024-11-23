#!/usr/bin/env bash

# Show executed commands
#set -x

# Data configuration
REPOSITORY="https://github.com/alelievr/libft-unit-test"
echo "Repository is $REPOSITORY"

C_FILES="ft_isalpha.c \
ft_isdigit.c \
ft_isalnum.c \
ft_isascii.c \
ft_isprint.c \
ft_strlen.c \
ft_memset.c \
ft_bzero.c \
ft_memcpy.c \
ft_memmove.c \
ft_strlcpy.c \
ft_strlcat.c \
ft_toupper.c \
ft_tolower.c \
ft_strchr.c \
ft_strrchr.c \
ft_strncmp.c \
ft_memchr.c \
ft_memcmp.c \
ft_strnstr.c \
ft_atoi.c \
ft_calloc.c \
ft_strdup.c \
ft_substr.c \
ft_strjoin.c \
ft_strtrim.c \
ft_split.c \
ft_itoa.c \
ft_strmapi.c \
ft_striteri.c \
ft_putchar_fd.c \
ft_putstr_fd.c \
ft_putendl_fd.c \
ft_putnbr_fd.c"

O_FILES=${C_FILES//.c/.o}

C_FILES_BONUS="ft_lstnew_bonus.c \
ft_lstadd_front_bonus.c \
ft_lstsize_bonus.c \
ft_lstlast_bonus.c \
ft_lstadd_back_bonus.c \
ft_lstdelone_bonus.c \
ft_lstclear_bonus.c \
ft_lstiter_bonus.c \
ft_lstmap_bonus.c"

O_FILES_BONUS=${C_FILES_BONUS//.c/.o}

# Create a temporary directory
TMP_DIR=$(mktemp -d)
echo "Temporary directory in $TMP_DIR"

# Create a directory for the tests
TMP_DIR_TESTS="$TMP_DIR/tests"
mkdir -p "$TMP_DIR_TESTS"

# Clone the tests
git clone "$REPOSITORY" "$TMP_DIR_TESTS"

# Copy the sources
cp -r "$PWD" "$TMP_DIR"

# Add the so rule to the Makefile
if [[ "$1" == "m" ]]; then
    SO_CONTENT="
so:
	cc -nostartfiles -fPIC $C_FILES
	cc -nostartfiles -shared -o libft.so $O_FILES"
    echo "$SO_CONTENT" >> "$TMP_DIR/libft/Makefile"
fi

if [[ "$1" == "b" ]]; then
    SO_CONTENT="
so:
	cc -nostartfiles -fPIC $C_FILES $C_FILES_BONUS
	cc -nostartfiles -shared -o libft.so $O_FILES $O_FILES_BONUS"
    echo "$SO_CONTENT" >> "$TMP_DIR/libft/Makefile"
fi

# Run the compilation steps
make -C "$TMP_DIR_TESTS"

# Run the tests
make -C "$TMP_DIR_TESTS" f

# Clean up
rm -rf "$TMP_DIR"