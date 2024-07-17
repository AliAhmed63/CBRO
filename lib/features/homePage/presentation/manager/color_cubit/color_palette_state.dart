part of 'color_palette_cubit.dart';

@immutable
abstract class ColorPaletteState {}

class ColorPaletteInitial extends ColorPaletteState {}

class ColorPaletteLoaded extends ColorPaletteState {
  final List<ColorInfo> colorInfo;

  ColorPaletteLoaded(this.colorInfo);
}
