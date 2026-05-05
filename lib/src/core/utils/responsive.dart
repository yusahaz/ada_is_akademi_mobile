double responsiveHorizontalPadding(double width) {
  if (width >= 1024) return 96;
  if (width >= 768) return 64;
  if (width >= 600) return 40;
  return 24;
}
