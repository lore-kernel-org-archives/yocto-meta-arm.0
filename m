Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web08.2955.1615515967379494101
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Mar 2021 18:26:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VXWL2ric;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id l4so22922965qkl.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Mar 2021 18:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=G4p6/k1yb5muxNbfZ/gPQ0Kfcdxquy+qV6LoPW19dck=;
        b=VXWL2ricKFrQW69shCM5Jk19+Zavs8faNspvICMFOI/qHUKulWn0PJbKBuu/4g4lHn
         2b4Min37zaZ2DbscQxNAYxeK4IOSyC44UPb7VjSDxp6onu7l8XTO7QxscpNcpZoMagig
         jEMqAtfax3zo/zDcHw9z8VTFAVh3kP+qCjNZi2dRV+c4NFG5onKVfQANs/UV05WJwgAX
         cNDEUKHnIJB9wF1QymFz/B+Sja+3b3z0Sc62631f5vdp94WN1E3iz9oM38xqMRvJ0DSf
         zdlK1BzTy77YeMakPxuUKknH0ju1ymFj4lZObUrmEqFdOd4foGQ/vgPIeyFhHdyoa3pL
         Sj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=G4p6/k1yb5muxNbfZ/gPQ0Kfcdxquy+qV6LoPW19dck=;
        b=es484KbPhMRTM+54vv5ycC6xye8VGvaCM/xXrh6XvcOzKIlwSh8G2EvWV99XnanTRK
         w6zPHTNAuWA42qkndXBJWQ9VRxzFc+oXGp5P65uHev/HkVftgNWVpYzz4vYeun6F/6BZ
         OLHWzsipP9O5Cn+BTqGvZm1fTrz5pevfi/JIGeWQFFhl/n6hXPJ8YmbDgxRh2SjCFvBS
         sAWMJE8N5p+th2UApksLw4pzl7e8wQaW5xq6oqdV8xg2vq/30TpfdoZYS2VgSbeP6xQg
         PbKjtfaNt+LbAVjXjL6sIR2y+RRdGFvuO+yH2fLhzINvoZkp7Gm6dJIOQMzk/8L7yjw8
         7WGg==
X-Gm-Message-State: AOAM531F7T0T9r1Ly7+kgDZW7oCV32U2niDa2gTp5OVXoOYUAPMWHQpu
	IDH5P1DwjMHXODR4X9EIDEqI8Q==
X-Google-Smtp-Source: ABdhPJwMcb0CLrPC7Uyd1vOnw5MMcOfftSrPo9cnMpx5OTYv8Hkehi70tmybR8foGBcknHcmLLUv0w==
X-Received: by 2002:a05:620a:24c7:: with SMTP id m7mr11172779qkn.219.1615515966454;
        Thu, 11 Mar 2021 18:26:06 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:9da8:e703:cc1b:6d6a])
        by smtp.gmail.com with ESMTPSA id o7sm3229278qki.63.2021.03.11.18.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 18:26:06 -0800 (PST)
Date: Thu, 11 Mar 2021 21:26:04 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/4] arm-autonomy/xenguest: Generate xenguest.env containing variable values
Message-ID: <20210312022604.GA20326@kudzu.us>
References: <20210310173255.15222-1-nathan.dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210310173255.15222-1-nathan.dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 10, 2021 at 05:32:52PM +0000, Nathan Dunne wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Added task "do_deploy_xenguestenv" to xenguest_image.bbclass which creates
> intermediary files for each recipe that inherits xenguest_image. These files
> are merged into the main xenguest.env file in DEPLOY_DIR_IMAGE by the task
> "do_merge_xenguestenv" in image_types_xenguest.bbclass, which has a dependency
> on all do_deploy_xenguestenv in recipes it depends on.
> 
> Variables to write to the file are listed in XENGUEST_IMAGE_VARS, and any
> extra variables in child recipes should be added to XENGUEST_IMAGE_VARS_EXTRA
> 
> xenguest-image had to be renamed xenguest_image to use EXPORT, since dash is
> illegal in bash function names.
> 
> Issue-Id: SCM-2035
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: I6fe45b8a5db6eb7a757c6150515da0b4de8a7205
> ---

Series applied to master.

Thanks,
Jon

>  .../classes/image_types_xenguest.bbclass      | 63 ++++++++++++++++++-
>  .../classes/kernel-xenguest.bbclass           |  7 ++-
>  ...t-image.bbclass => xenguest_image.bbclass} | 49 ++++++++++++++-
>  ...a.bbclass => xenguest_image_extra.bbclass} | 31 +++++----
>  .../documentation/arm-autonomy-multiconfig.md |  2 +-
>  .../documentation/arm-autonomy-quickstart.md  |  3 +-
>  .../xenguest/xenguest-base-image.bb           | 12 +++-
>  .../xenguest/xenguest-nodisk-image.bb         |  2 +-
>  8 files changed, 147 insertions(+), 22 deletions(-)
>  rename meta-arm-autonomy/classes/{xenguest-image.bbclass => xenguest_image.bbclass} (79%)
>  rename meta-arm-autonomy/classes/{xenguest-image-extra.bbclass => xenguest_image_extra.bbclass} (79%)
> 
> diff --git a/meta-arm-autonomy/classes/image_types_xenguest.bbclass b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> index 195d6ed..2b9505f 100644
> --- a/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> +++ b/meta-arm-autonomy/classes/image_types_xenguest.bbclass
> @@ -1,7 +1,7 @@
>  # Create a xenguest image with kernel and filesystem produced by Yocto
>  # This will create a .xenguest file that the xenguest-manager can use.
>  
> -inherit xenguest-image
> +inherit xenguest_image
>  
>  # We are creating our guest in a local subdirectory
>  # force the value so that we are not impacted if the user is changing it
> @@ -63,6 +63,67 @@ IMAGE_TYPEDEP_xenguest ?= "tar"
>  IMAGE_TYPES_MASKED += "xenguest"
>  IMAGE_TYPES += "xenguest"
>  
> +XENGUEST_IMAGE_RECIPE = "${PN}"
> +XENGUEST_IMAGE_VARS += "XENGUEST_IMAGE_RECIPE"
> +
> +# Merge intermediate env files from all recipes into a single file
> +python do_merge_xenguestenv () {
> +
> +    import re
> +
> +    # Open final merged file in DEPLOY_DIR_IMAGE for writing, or create
> +    outdir = d.getVar('DEPLOY_DIR_IMAGE')
> +    with open(os.path.join(outdir,'xenguest.env'), 'w') as merged_file:
> +
> +        # Adds vars from xenguest_image to list
> +        merged_env = []
> +        xenguest_vars = d.getVar('XENGUEST_IMAGE_VARS')
> +        for var in xenguest_vars.split():
> +            value = d.getVar(var)
> +            if value:
> +                merged_env.append(var + "=" + " ".join(value.split()) + "\n")
> +
> +        # Resolve dependencies for this task to find names of intermediate
> +        # .xenguestenv files
> +        taskdepdata = d.getVar('BB_TASKDEPDATA')
> +        task_mc = d.getVar('BB_CURRENT_MC')
> +        task_file = d.getVar('FILE')
> +
> +        # See runqueue.py function build_taskdepdata
> +        DEPS_INDEX = 3
> +
> +        depdata_key = task_file + ":do_merge_xenguestenv"
> +
> +        # If in a multiconfig, need to add that to the key
> +        if task_mc != "default":
> +            depdata_key = "mc:" + task_mc + ":" + depdata_key
> +
> +        # Retrieve filename using regex
> +        get_filename = re.compile(r'/([^/]+\.bb):do_deploy_xenguestenv$')
> +        env_dir = d.getVar('XENGUEST_ENV_STAGING_DIR')
> +
> +        for task_dep in taskdepdata[depdata_key][DEPS_INDEX]:
> +            if task_dep.endswith(":do_deploy_xenguestenv"):
> +                filename = re.search(get_filename, task_dep).group(1) + ".xenguestenv"
> +                bb.note("Merging: " + filename)
> +                try:
> +                    with open(env_dir + "/" + filename, 'r') as f:
> +                        # Eliminate duplicates
> +                        merged_env = list(set(merged_env + f.readlines()))
> +                except (FileNotFoundError, IOError):
> +                    bb.note(" " + filename + " has no extra vars")
> +
> +        # Sort Alphabetically and write
> +        merged_env.sort()
> +        merged_file.write("".join(merged_env))
> +}
> +do_merge_xenguestenv[dirs] = "${DEPLOY_DIR_IMAGE}"
> +do_merge_xenguestenv[vardeps] += "${XENGUEST_IMAGE_VARS}"
> +do_merge_xenguestenv[vardepsexclude] += "BB_TASKDEPDATA"
> +do_merge_xenguestenv[recrdeptask] += "do_deploy_xenguestenv"
> +
> +addtask merge_xenguestenv before do_populate_lic_deploy after do_image_complete
> +
>  python __anonymous() {
>      # Do not do anything if we are not in the want FSTYPES
>      if bb.utils.contains_any('IMAGE_FSTYPES', 'xenguest', '1', '0', d):
> diff --git a/meta-arm-autonomy/classes/kernel-xenguest.bbclass b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> index a4954aa..085fd56 100644
> --- a/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> +++ b/meta-arm-autonomy/classes/kernel-xenguest.bbclass
> @@ -3,7 +3,10 @@
>  # This is done using kernel-fitimage as model
>  # To activate this, kernel-xenguest must be added to KERNEL_CLASSES
>  
> -inherit xenguest-image
> +# Add a variable name to XENGUEST_IMAGE_VARS_EXTRA if you want it to
> +# appear in xenguest.env when the image is deployed
> +
> +inherit xenguest_image
>  
>  # use a local copy to pack all together
>  XENGUEST_IMAGE_DEPLOY_DIR = "${WORKDIR}/tmp-xenguest"
> @@ -24,7 +27,7 @@ do_assemble_xenguest_initramfs() {
>      rm -f ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
>      call_xenguest_mkimage pack ${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest
>  }
> -do_assemble_xenguest_initramfs[depends] += "${INITRAMFS_IMAGE}:do_image_complete"
> +do_assemble_xenguest_initramfs[depends] += "${INITRAMFS_IMAGE}:do_merge_xenguestenv"
>  
>  kernel_do_deploy_append() {
>      if [ -f "${B}/${KERNEL_OUTPUT_DIR}/Image-initramfs.xenguest" ]; then
> diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest_image.bbclass
> similarity index 79%
> rename from meta-arm-autonomy/classes/xenguest-image.bbclass
> rename to meta-arm-autonomy/classes/xenguest_image.bbclass
> index 5e5c4c7..8cab845 100644
> --- a/meta-arm-autonomy/classes/xenguest-image.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest_image.bbclass
> @@ -30,7 +30,7 @@ XENGUEST_IMAGE_ROOT ??= "/dev/xvda1"
>  # Guest kernel command line arguments
>  XENGUEST_IMAGE_CMDLINE ??= "earlyprintk=xenboot console=hvc0 rw"
>  
> -# Extra commands to add to xenguest-image when creating the image
> +# Extra commands to add to xenguest_image when creating the image
>  XENGUEST_IMAGE_EXTRA_CMD ??= ""
>  
>  # Kernel binary
> @@ -83,6 +83,18 @@ XENGUEST_IMAGE_DEPLOY_SUBDIR ?= "xenguest"
>  # - something in ${WORKDIR} if you need to clone and manipulate an image
>  XENGUEST_IMAGE_DEPLOY_DIR ??= "${DEPLOYDIR}"
>  
> +# These vars are used by image_types_xenguest.bbclass to generate the
> +# xenguest.env file. In a recipe that inherits this class and extra variables
> +# that should be included in xenguest.env need to be added to
> +# XENGUEST_IMAGE_VARS_EXTRA
> +XENGUEST_IMAGE_VARS ?= "\
> + MACHINE DISTRO DISTRO_VERSION DISTRO_FEATURES TUNE_FEATURES TARGET_FPU \
> + IMAGE_FEATURES INITRAMFS_IMAGE_BUNDLE INITRAMFS_IMAGE \
> + XENGUEST_IMAGE_MEMORY_SIZE XENGUEST_IMAGE_NUM_VCPUS XENGUEST_IMAGE_AUTOBOOT \
> + XENGUEST_IMAGE_ROOT XENGUEST_IMAGE_CMDLINE XENGUEST_IMAGE_EXTRA_CMD \
> + XENGUEST_IMAGE_KERNEL XENGUEST_IMAGE_DISK_SIZE XENGUEST_IMAGE_DISK_DEVICE \
> + XENGUEST_IMAGE_DISK_PARTITIONS XENGUEST_IMAGE_NETWORK_TYPE"
> +
>  #
>  # Wrapper to call xenguest-mkimage
>  # It is using XENGUEST_IMAGE_DEPLOY_DIR and XENGUEST_IMAGE_DEPLOY_SUBDIR
> @@ -167,7 +179,38 @@ xenguest_image_create() {
>      fi
>  }
>  
> -#
> +XENGUEST_ENV_STAGING_DIR ??= "${STAGING_DIR}/${MACHINE}/xenguestenv"
> +
> +# Create an intermediary file containing all variables used to by a
> +# particular recipe that inherits this class
> +
> +# File will contain the values of all variables listed in:
> +#   XENGUEST_IMAGE_VARS_EXTRA
> +python do_deploy_xenguestenv () {
> +    xenguest_vars = d.getVar('XENGUEST_IMAGE_VARS_EXTRA')
> +    if not xenguest_vars:
> +        return
> +
> +    outdir = d.getVar('XENGUEST_ENV_STAGING_DIR')
> +
> +    # Writes file to tmp/sysroots/${MACHINE}/xenguestenv/ by default
> +    filename = os.path.basename(d.getVar('FILE')) + '.xenguestenv'
> +    with open(os.path.join(outdir, filename), 'w') as envf:
> +        for var in xenguest_vars.split():
> +            value = d.getVar(var)
> +            if value:
> +                # Write value only if set
> +                envf.write('%s="%s"\n' % (var, " ".join(value.split())))
> +        envf.close()
> +}
> +
> +# Since the intermediary file is deleted by do_merge_xenguestenv it
> +# must be re-created every time
> +do_deploy_xenguestenv[vardeps] += "${XENGUEST_IMAGE_VARS_EXTRA}"
> +do_deploy_xenguestenv[dirs] = "${XENGUEST_ENV_STAGING_DIR}"
> +
> +addtask deploy_xenguestenv before do_populate_sysroot
> +
>  # Clone the current xenguest from deploy to manipulate it locally
>  # This is required if you need to change things before packing an image
>  # To set the local directory where to clone you must set
> @@ -181,7 +224,7 @@ xenguest_image_clone() {
>      fi
>  
>      if [ ! -f ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}/guest.cfg ]; then
> -        die "xenguest-image: ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR} does not contain a valid guest"
> +        die "xenguest_image: ${DEPLOY_DIR_IMAGE}/${XENGUEST_IMAGE_DEPLOY_SUBDIR} does not contain a valid guest"
>      fi
>  
>      rm -rf ${XENGUEST_IMAGE_DEPLOY_DIR}/${XENGUEST_IMAGE_DEPLOY_SUBDIR}
> diff --git a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass b/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
> similarity index 79%
> rename from meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> rename to meta-arm-autonomy/classes/xenguest_image_extra.bbclass
> index 533b973..3123f49 100644
> --- a/meta-arm-autonomy/classes/xenguest-image-extra.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest_image_extra.bbclass
> @@ -4,8 +4,11 @@
>  # The class is extending deploy function so you recipe must inherit deploy and
>  # have a do_deploy function (even if it is empty)
>  
> -# Use standard xenguest-image
> -inherit xenguest-image
> +# Add a variable name to XENGUEST_IMAGE_VARS_EXTRA if you want it to
> +# appear in xenguest.env when the image is deployed
> +
> +# Use standard xenguest_image
> +inherit xenguest_image
>  
>  # Add a DTB file for the guest
>  # Only one file should be added, if this is set multiple times or in several
> @@ -39,6 +42,12 @@ XENGUEST_EXTRA_FILES ??= ""
>  # dir1/file1 file in the disk content parameters).
>  XENGUEST_EXTRA_DISK_FILES ??= ""
>  
> +# Extra vars to be written to xenguest.env
> +XENGUEST_IMAGE_VARS_EXTRA += "\
> + XENGUEST_EXTRA_DTB XENGUEST_EXTRA_RAMDISK XENGUEST_EXTRA_XENCONFIG \
> + XENGUEST_EXTRA_INIT_PRE XENGUEST_EXTRA_INIT XENGUEST_EXTRA_INIT_POST \
> + XENGUEST_EXTRA_FILES XENGUEST_EXTRA_DISK_FILES"
> +
>  do_deploy_append() {
>      if [ -z "${XENGUEST_IMAGE_DEPLOY_DIR}" -o \
>          -z "${XENGUEST_IMAGE_DEPLOY_SUBDIR}" ]; then
> @@ -49,14 +58,14 @@ do_deploy_append() {
>  
>      if [ -n "${XENGUEST_EXTRA_DTB}" ]; then
>          if [ ! -f ${XENGUEST_EXTRA_DTB} ]; then
> -            die "xenguest-image: DTB file ${XENGUEST_EXTRA_DTB} does not exist"
> +            die "xenguest_image: DTB file ${XENGUEST_EXTRA_DTB} does not exist"
>          fi
>          call_xenguest_mkimage partial --xen-device-tree=${XENGUEST_EXTRA_DTB}
>      fi
>  
>      if [ -n "${XENGUEST_EXTRA_RAMDISK}" ]; then
>          if [ ! -f ${XENGUEST_EXTRA_RAMDISK} ]; then
> -            die "xenguest-image: DTB file ${XENGUEST_EXTRA_RAMDISK} does not exist"
> +            die "xenguest_image: DTB file ${XENGUEST_EXTRA_RAMDISK} does not exist"
>          fi
>          call_xenguest_mkimage partial --xen-ramdisk=${XENGUEST_EXTRA_RAMDISK}
>      fi
> @@ -64,7 +73,7 @@ do_deploy_append() {
>      if [ -n "${XENGUEST_EXTRA_XENCONFIG}" ]; then
>          for f in ${XENGUEST_EXTRA_XENCONFIG}; do
>              if [ ! -f $f ]; then
> -                die "xenguest-image: Xen config $f does not exist"
> +                die "xenguest_image: Xen config $f does not exist"
>              fi
>              call_xenguest_mkimage partial --xen-append=$f
>          done
> @@ -72,21 +81,21 @@ do_deploy_append() {
>  
>      if [ -n "${XENGUEST_EXTRA_INIT_PRE}" ]; then
>          if [ ! -f ${XENGUEST_EXTRA_INIT_PRE} ]; then
> -            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT_PRE} does not exist"
> +            die "xenguest_image: Init script ${XENGUEST_EXTRA_INIT_PRE} does not exist"
>          fi
>          call_xenguest_mkimage partial --init-pre=${XENGUEST_EXTRA_INIT_PRE}
>      fi
>  
>      if [ -n "${XENGUEST_EXTRA_INIT}" ]; then
>          if [ ! -f ${XENGUEST_EXTRA_INIT} ]; then
> -            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT} does not exist"
> +            die "xenguest_image: Init script ${XENGUEST_EXTRA_INIT} does not exist"
>          fi
>          call_xenguest_mkimage partial --init-script=${XENGUEST_EXTRA_INIT}
>      fi
>  
>      if [ -n "${XENGUEST_EXTRA_INIT_POST}" ]; then
>          if [ ! -f ${XENGUEST_EXTRA_INIT_POST} ]; then
> -            die "xenguest-image: Init script ${XENGUEST_EXTRA_INIT_POST} does not exist"
> +            die "xenguest_image: Init script ${XENGUEST_EXTRA_INIT_POST} does not exist"
>          fi
>          call_xenguest_mkimage partial --init-post=${XENGUEST_EXTRA_INIT_POST}
>      fi
> @@ -94,7 +103,7 @@ do_deploy_append() {
>      if [ -n "${XENGUEST_EXTRA_FILES}" ]; then
>          for f in ${XENGUEST_EXTRA_FILES}; do
>              if [ ! -f $f ]; then
> -                die "xenguest-image: Xen file $f does not exist"
> +                die "xenguest_image: Xen file $f does not exist"
>              fi
>              call_xenguest_mkimage partial --xen-add-file=$f
>          done
> @@ -103,12 +112,12 @@ do_deploy_append() {
>      if [ -n "${XENGUEST_EXTRA_DISK_FILES}" ]; then
>          for f in ${XENGUEST_EXTRA_DISK_FILES}; do
>              if [ ! -f $f ]; then
> -                die "xenguest-image: Disk file $f does not exist"
> +                die "xenguest_image: Disk file $f does not exist"
>              fi
>              call_xenguest_mkimage partial --disk-add-file=$f
>          done
>      fi
>  }
> -# Need to have xenguest-image tool
> +# Need to have xenguest_image tool
>  do_deploy[depends] += "xenguest-base-image:do_deploy"
>  
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
> index 8fd60f1..e6f90b5 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md
> @@ -78,7 +78,7 @@ MC_GUEST_FILENAME_PREFIX = "${@ 'Image-initramfs' if d.getVar('MC_GUEST_INITRAMF
>  
>  MC_GUEST_FILENAME = "${MC_GUEST_FILENAME_PREFIX}-${MC_GUEST_MACHINE}.xenguest"
>  
> -MC_GUEST_DEP = "${@ 'virtual/kernel:do_deploy' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_IMAGERECIPE}:do_image_complete'}"
> +MC_GUEST_DEP = "${@ 'virtual/kernel:do_deploy' if d.getVar('MC_GUEST_INITRAMFS_IMAGE_BUNDLE',d) else '${MC_GUEST_IMAGERECIPE}:do_merge_xenguestenv'}"
>  
>  MC_DOIMAGE_MCDEPENDS += "mc:${MC_HOST}:${MC_GUEST}:${MC_GUEST_DEP} "
>  
> diff --git a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> index 1b72917..e46729d 100644
> --- a/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> +++ b/meta-arm-autonomy/documentation/arm-autonomy-quickstart.md
> @@ -142,7 +142,8 @@ To create a guest project:
>     For example `bitbake core-image-minimal`
>  
>  The build will create a ".xenguest" image that can be use on an host project
> -with the xenguest-manager.
> +with the xenguest-manager, as well as a file "xenguest.env" containing the
> +variables used to configure the guest image.
>  
>  The guest can also be built as a 'multiconfig' sub project of the host, see
>  `meta-arm-autonomy/documentation/arm-autonomy-multiconfig.md` for more information
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> index 4cc96aa..d4b748e 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-base-image.bb
> @@ -1,7 +1,7 @@
>  # Create a xenguest base image
>  #
>  # This recipe creates a base image that is then extended by other recipes
> -# through xenguest-image class.
> +# through xenguest_image class.
>  # xenguest image type is using this as base to add a kernel and a disk image
>  # to create a guest
>  #
> @@ -72,7 +72,15 @@ XENGUEST_IMAGE_SRC_URI_INIT_POST ??= ""
>  
>  S = "${WORKDIR}"
>  
> -inherit deploy xenguest-image
> +# Extra vars to add to xenguest.env
> +XENGUEST_IMAGE_VARS_EXTRA += "\
> + XENGUEST_IMAGE_HOST_PORT XENGUEST_IMAGE_GUEST_PORT \
> + XENGUEST_IMAGE_NAT_PORT_FORWARD_SCRIPT XENGUEST_IMAGE_SRC_URI_DISK_FILES \
> + XENGUEST_IMAGE_SRC_URI_XEN_FILES XENGUEST_IMAGE_SRC_URI_XEN_CONFIG \
> + XENGUEST_IMAGE_SRC_URI_INIT_PRE XENGUEST_IMAGE_SRC_URI_INIT \
> + XENGUEST_IMAGE_SRC_URI_INIT_POST"
> +
> +inherit deploy xenguest_image
>  
>  # parse XENGUEST_IMAGE_SRC_URI_ variables and add them to SRC_URI
>  python __anonymous() {
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb
> index b2dbbe9..8ff24a1 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-nodisk-image.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  
>  S = "${WORKDIR}"
>  
> -inherit deploy xenguest-image
> +inherit deploy xenguest_image
>  
>  # Name of the file we create in deploy
>  XENGUEST_IMAGE_NODISK_DEPLOY = "xenguest-nodisk-image.xenguest"
> -- 
> 2.17.1
> 

> 
> 
> 

