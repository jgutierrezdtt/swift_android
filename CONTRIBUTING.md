# Contributing Guide

Thank you for your interest in contributing to the Swift Cross-Platform Hello World project!

## Project Goals

This project demonstrates:
1. Cross-platform Swift development for iOS and Android
2. Using the Swift SDK for Android (October 2025)
3. Best practices for Swift Package Manager
4. CI/CD automation with GitHub Actions

## How to Contribute

### Reporting Issues

- Use the GitHub issue tracker
- Include Swift version, OS, and error messages
- Provide steps to reproduce the issue

### Code Contributions

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```
3. **Make your changes**
   - Follow existing code style
   - Add comments for complex logic
   - Update documentation as needed
4. **Test your changes**
   - Build on all supported platforms if possible
   - Run existing tests
5. **Commit with clear messages**
   ```bash
   git commit -m "Add feature: description"
   ```
6. **Push and create a Pull Request**

### Code Style

- Follow Swift API Design Guidelines
- Use 4 spaces for indentation
- Keep line length under 120 characters
- Use meaningful variable and function names

### Testing

- Ensure code builds on Linux (for Android)
- Test on macOS if contributing iOS changes
- Verify GitHub Actions pass

### Areas for Contribution

- [ ] Enhanced Android UI integration
- [ ] Additional platform examples
- [ ] Documentation improvements
- [ ] Performance optimizations
- [ ] Additional CI/CD platforms
- [ ] Sample projects using the framework

## Development Setup

See [QUICKSTART.md](QUICKSTART.md) for setup instructions.

## Questions?

Open an issue for questions or discussion.

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
