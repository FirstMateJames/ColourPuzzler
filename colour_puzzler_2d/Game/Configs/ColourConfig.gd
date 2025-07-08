class_name ColourConfig

enum Colours {
	Red,
	Green,
	Blue,
	Yellow
}

const GET_COLOUR := {
	Colours.Red : Color.RED,
	Colours.Green : Color.GREEN,
	Colours.Blue : Color.BLUE,
	Colours.Yellow : Color.YELLOW
}

static func get_color(colour : Colours) -> Color:
	return GET_COLOUR.get(colour)
