# a simple LP example
#
#   maximize x + y
#
#   s.t. 50 x + 24 y <= 2400
#        30 x + 33 y <= 2100
#        x >= 45, y >= 5
#
#   solution: x = 45, y = 6.25, objv = 51.25

using Xpress



model = Xpress.Model("lp_01", :maximize)

# add variables
add_cvar!(model, 1.0, 45., Inf)  # x
add_cvar!(model, 1.0,  5., Inf)  # y
#update_model!(model)

# add constraints
add_constr!(model, [50., 24.], '<', 2400.)
add_constr!(model, [30., 33.], '<', 2100.)
#update_model!(model)

println(model)

# perform optimization
optimize(model)

# show results
info = get_optiminfo(model)
println()
println(info)

sol = get_solution(model)
println("soln = $(sol)")

objv = get_objval(model)
println("objv = $(objv)")

gc()  # test finalizers
