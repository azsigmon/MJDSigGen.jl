# This file is a part of MJDSigGen, licensed under the MIT License (MIT).

immutable Struct_point
    x::Cfloat
    y::Cfloat
    z::Cfloat
end

Struct_point() = Struct_point(0, 0, 0)


immutable Struct_int_pt
    x::Cint
    y::Cint
    z::Cint
end

Struct_int_pt() = Struct_int_pt(0, 0, 0)


immutable Struct_cyl_pt
    r::Cfloat
    phi::Cfloat
    z::Cfloat
end

Struct_cyl_pt() = Struct_cyl_pt(0, 0, 0)


immutable Struct_cyl_int_pt
    r::Cint
    phi::Cint
    z::Cint
end

Struct_cyl_int_pt() = Struct_cyl_int_pt(0, 0, 0)


type Struct_velocity_lookup
    e::Cfloat
    e100::Cfloat
    e110::Cfloat
    e111::Cfloat
    h100::Cfloat
    h110::Cfloat
    h111::Cfloat
    ea::Cfloat
    eb::Cfloat
    ec::Cfloat
    ebp::Cfloat
    ecp::Cfloat
    ha::Cfloat
    hb::Cfloat
    hc::Cfloat
    hbp::Cfloat
    hcp::Cfloat
    hcorr::Cfloat
    ecorr::Cfloat

    Struct_velocity_lookup() = new()
end


type Struct_MJD_Siggen_Setup
    # general
    verbosity::Cint

    # geometry
    xtal_length::Cfloat
    xtal_radius::Cfloat
    pc_length::Cfloat
    pc_radius::Cfloat
    wrap_around_radius::Cfloat
    ditch_depth::Cfloat
    ditch_thickness::Cfloat
    bottom_taper_length::Cfloat
    hole_length::Cfloat
    hole_radius::Cfloat
    outer_taper_length::Cfloat
    taper_angle::Cfloat
    inner_taper_length::Cfloat
    outer_taper_width::Cfloat
    inner_taper_width::Cfloat
    top_bullet_radius::Cfloat
    bottom_bullet_radius::Cfloat
    Li_thickness::Cfloat

    # electric fields & weighing potentials
    xtal_grid::Cfloat
    impurity_z0::Cfloat
    impurity_gradient::Cfloat
    impurity_quadratic::Cfloat
    impurity_surface::Cfloat
    impurity_radial_add::Cfloat
    impurity_radial_mult::Cfloat
    impurity_rpower::Cfloat
    xtal_HV::Cfloat
    max_iterations::Cint
    write_field::Cint
    write_WP::Cint
    bulletize_PC::Cint

    # file names
    drift_name::NTuple{256,Cchar}
    field_name::NTuple{256,Cchar}
    wp_name::NTuple{256,Cchar}

    # signal calculation 
    xtal_temp::Cfloat
    preamp_tau::Cfloat
    time_steps_calc::Cint
    step_time_calc::Cfloat
    step_time_out::Cfloat
    charge_cloud_size::Cfloat
    use_diffusion::Cint
    energy::Cfloat

    coord_type::Cint
    ntsteps_out::Cint

    # data for fields.c
    rmin::Cfloat
    rmax::Cfloat
    rstep::Cfloat
    zmin::Cfloat
    zmax::Cfloat
    zstep::Cfloat
    rlen::Cint
    zlen::Cint
    v_lookup_len::Cint
    v_lookup::Ptr{Struct_velocity_lookup}
    efld::Ptr{Ptr{Struct_cyl_pt}}
    wpot::Ptr{Ptr{Cfloat}}

    # data for calc_signal.c
    dpath_e::Ptr{Struct_point}
    dpath_h::Ptr{Struct_point}
    initial_vel::Cfloat
    final_vel::Cfloat
    dv_dE::Cfloat
    v_over_E::Cfloat
    final_charge_size::Cdouble

    Struct_MJD_Siggen_Setup() = begin
        x = new()
        x
    end
end
