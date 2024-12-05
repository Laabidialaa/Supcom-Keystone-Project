#!/bin/bash

# Fonction pour détecter la distribution Linux
detect_linux_distribution() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        if [ -n "$NAME" ] && [ -n "$VERSION_ID" ]; then
            OS=$NAME
            VERSION=$VERSION_ID
        else
            echo "Erreur : Les variables NAME et VERSION_ID ne sont pas définies dans /etc/os-release."
            exit 1
        fi
    elif type lsb_release >/dev/null 2>&1; then
        OS=$(lsb_release -si)
        VERSION=$(lsb_release -sr)
    else
        OS=$(uname -s)
        VERSION=$(uname -r)
    fi

    if [ -z "$OS" ]; then
        echo "Erreur : Impossible de détecter la distribution Linux."
        exit 1
    fi

    echo "Distribution détectée : $OS $VERSION"
}

