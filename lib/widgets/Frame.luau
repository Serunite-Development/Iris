local Types = require(script.Parent.Parent.Types)

return function(Iris: Types.Internal, widgets: Types.WidgetUtility)
    Iris.WidgetConstructor("Frame", {
        hasState = false,
        hasChildren = true,
        Args = {
            ["WidthScale"] = 1,
        },
        Events = {},
        Generate = function(thisWidget: Types.Widget): Frame
            local Frame: Frame = Instance.new("Frame")
            Frame.Name = "Iris_Frame"
            Frame.BackgroundTransparency = 1
            Frame.BackgroundColor3 = Color3.new()
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromScale(thisWidget.arguments.WidthScale, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.ZIndex = thisWidget.ZIndex
            Frame.LayoutOrder = thisWidget.ZIndex
            Frame.ClipsDescendants = true

            widgets.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, Iris._config.ItemSpacing.X))
            
            return Frame
        end,
        Update = function(_thisWidget: Types.Widget)
            local Frame = _thisWidget.Instance :: TextLabel
            
            Frame.Size = UDim2.fromScale(_thisWidget.arguments.WidthScale, 0)
        end,
        Discard = function(thisWidget: Types.Widget)
            thisWidget.Instance:Destroy()
        end,
        ChildAdded = function(thisWidget: Types.Widget, _thisChild: Types.Widget)
            return thisWidget.Instance
        end,
    } :: Types.WidgetClass)
end
