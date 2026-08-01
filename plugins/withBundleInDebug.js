const { withAppBuildGradle } = require('@expo/config-plugins');

/**
 * Bundle JS into debug APKs so installs work without Metro.
 */
function withBundleInDebug(config) {
  return withAppBuildGradle(config, (config) => {
    let contents = config.modResults.contents;
    if (contents.includes('debuggableVariants = []')) {
      return config;
    }

    const commented =
      /\/\/\s*debuggableVariants\s*=\s*\[[^\]]*\]/;
    if (commented.test(contents)) {
      contents = contents.replace(
        commented,
        'debuggableVariants = []',
      );
    } else if (contents.includes('autolinkLibrariesWithApp()')) {
      contents = contents.replace(
        'autolinkLibrariesWithApp()',
        `// Bundle JS for debug installs (no Metro required)\n    debuggableVariants = []\n\n    autolinkLibrariesWithApp()`,
      );
    }

    config.modResults.contents = contents;
    return config;
  });
}

module.exports = withBundleInDebug;
