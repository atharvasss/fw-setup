# FW-Setup

Fedora Workstation setup automated with Ansible.

## What it configures

- DNF & Flatpak applications
- Podman with Docker CLI compatibility
- DevOps/SRE tools
- Networking & troubleshooting utilities
- Cloud & Kubernetes tooling

## Usage

```bash
ansible-galaxy collection install community.general
ansible-playbook -i localhost, workstation.yml --ask-become-pass --check
