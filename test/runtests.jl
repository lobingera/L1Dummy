using Compat, Colors
import Compat.String

using L1Dummy

@compat import Base.show

if VERSION >= v"0.5.0-dev+7720"
    using Base.Test
else
    using BaseTestNext
    const Test = BaseTestNext
end

nothing
