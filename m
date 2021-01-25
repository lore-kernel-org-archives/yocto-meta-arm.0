Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.37146.1611584685451450006
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 25 Jan 2021 06:24:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=WO+gzoKx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id a12so2638947qkh.10
        for <meta-arm@lists.yoctoproject.org>; Mon, 25 Jan 2021 06:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sZPXWU1zeK6N25W+AON01nDFQQxVDG35ttZwOwgb5PY=;
        b=WO+gzoKx8k5i8YdpP7uGUaGiPvlC+OMDhxElJGDIPwxa+Z49ElldAThPle5OlQMTLH
         /VaSgwMnFIgm1X2eKGj/gRiXYQkCr7QewmlaPGpYdN0wPgY/Z2kQzyacRrQHlXmiXngX
         BH0gZQZOWq9+Oru7zbM29jzGcP7tpnByRVDl4KGFcMPIDE+s2dRmIV9tpChQdb0OibeW
         YHzem9Zhs7SRf52+MR/wGR7S7ivH21aEYkKBmTxxn9mGtiPmHYdm38UZmnE85QqSRlpQ
         oNbO1enG3fc0VAlMyA+9DdWV1B+NWuUecovvbeZmaLelpw9rvc9MeioBR+cwaM7MXMRO
         m19A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sZPXWU1zeK6N25W+AON01nDFQQxVDG35ttZwOwgb5PY=;
        b=VIBLXdZl4QKzrpWKBOyXqzzFUjI6m6l/BmPX+qfOBiNwD2suqr8IGjk+pZ99FyEU5r
         NUEqAnDmgqRrdk2WMqiYIiKxi4xSWSlOE76PPm3tSpieInh35lxSDB2XLbixYg1dFa5Z
         lFYcZFuKI9GjaNgELReZq/ZBEXxnDOHxckl/OwkvHwkfcv2BWdvj9vpny+OQi/7PMJkm
         1N6ZXj/jjYSjzjebkpNpwIUMarsrmb8nuJ7i3jY/3sMVfvMWsRvMHKbOG5TSjlj4NezJ
         uvzSy18Q0cck3v/Lx4JE6iF81DhJgOXqPbTxDoc7FXuLVrNsalQvRaExRPleoG79Wi4u
         /K0Q==
X-Gm-Message-State: AOAM531FemULxNu6EN9DzNLKlmIJxjfgEW9XDFqIrZAc/vPP3mOQiFlr
	YjVpD4qX3VfZ/SJ2Yx0ba3XkRQ==
X-Google-Smtp-Source: ABdhPJwQrecO72sRCMY5Z+syAHkIZliMra4sHm+5fxNQh388AF/bBFNcY+vR68qtiUrg26GIMIe9AA==
X-Received: by 2002:a37:4796:: with SMTP id u144mr879840qka.235.1611584684488;
        Mon, 25 Jan 2021 06:24:44 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:3c22:b900:34fe:f580])
        by smtp.gmail.com with ESMTPSA id 77sm64124qkk.29.2021.01.25.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 06:24:44 -0800 (PST)
Date: Mon, 25 Jan 2021 09:24:42 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH 1/3] arm-autonomy/xenguest: Add guestcount support
Message-ID: <20210125142442.GA21346@kudzu.us>
References: <20210120131716.30428-1-nathan.dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210120131716.30428-1-nathan.dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 20, 2021 at 01:17:14PM +0000, Nathan Dunne wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Add guestcount parameter to ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS,
> to create multiple guests with the same config. Symlinks are created
> in the host rootfs pointing to the original xenguest file
> 
> Parameters for ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS are now
> retrieved using python regex rather than split, so that they can
> appear in any order
> 
> Issue-Id: SCM-1863
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: Ifa5f5ab3b284815427c94979b3f1a5eed592ec3c
> ---

Series pushed into the master branch.

Thanks,
Jon

>  .../images/arm-autonomy-host-image-minimal.bb | 54 +++++++++++++------
>  .../xenguest/files/xenguest-manager           | 22 ++++++--
>  2 files changed, 58 insertions(+), 18 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> index 50378b1..8245e9a 100644
> --- a/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> +++ b/meta-arm-autonomy/recipes-core/images/arm-autonomy-host-image-minimal.bb
> @@ -14,12 +14,21 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
>  # The ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS variable can be used to include in the
>  # image one or several xenguest images.
>  # The list must be space separated and each entry must have the following
> -# format: URL[;guestname=NAME]
> +# format: URL[;params]
>  #  - URL can be the full path to a file or a Yocto compatible SRC_URI url
> -#  - guestname=NAME can be used to specify the name of the guest. If not
> -#    specified the basename of the file (without .xenguest extension) is used.
> +#  - params encompasses two values that can be optionally set:
> +#    - guestname=NAME can be used to specify the name of the guest. If not
> +#      specified the default value is the basename of the file
> +#      (without .xenguest extension).
> +#    - guestcount=NUM can be used to created NUM guests with the same config.
> +#      All guests after the first will have numbers appended to the guestname,
> +#      starting from 2. In the rootfs additional xenguest files will be
> +#      symlinks to the original.
> +#  params should be semicolon seperated, without a space, and can appear in
> +#  any order.
> +#
>  #  Here are examples of values:
> -#  /home/mydir/myguest.xenguest;guestname=guest1
> +#  /home/mydir/myguest.xenguest;guestname=guest1;guestcount=3
>  #  http://www.url.com/testguest.xenguest
>  #
>  #  If you are using the output of an other Yocto project, you should use the
> @@ -73,6 +82,11 @@ do_image[mcdepends] += "${DO_IMAGE_MCDEPENDS}"
>  
>  
>  python __anonymous() {
> +    import re
> +    guestfile_pattern = re.compile(r"^([^;]+);")
> +    guestname_pattern = re.compile(r";guestname=([^;]+);?")
> +    guestcount_pattern = re.compile(r";guestcount=(\d+);?")
> +
>      if bb.utils.contains('DISTRO_FEATURES', 'arm-autonomy-host', False, True, d):
>          raise bb.parse.SkipRecipe("DISTRO_FEATURES does not contain 'arm-autonomy-host'")
>  
> @@ -87,16 +101,19 @@ python __anonymous() {
>              # If the user just specified a file instead of file://FILE, add
>              # the file:// prefix
>              if guest.startswith('/'):
> -                guestfile = ''
> -                guestname = ''
> -                if ';guestname=' in guest:
> -                    # user specified a guestname
> -                    guestname = guest.split(';guestname=')[1]
> -                    guestfile = guest.split(';guestname=')[0]
> -                else:
> -                    # no guestname so use the basename
> -                    guestname = os.path.basename(guest)
> -                    guestfile = guest
> +                guestname = os.path.basename(guest)
> +                guestfile = guest
> +                guestcount = "1"
> +                f = guestfile_pattern.search(guest)
> +                n = guestname_pattern.search(guest)
> +                c = guestcount_pattern.search(guest)
> +
> +                if f is not None:
> +                    guestfile = f.group(1)
> +                if n is not None:
> +                    guestname = n.group(1)
> +                if c is not None:
> +                    guestcount = c.group(1)
>                  # in case we have a link we need the destination
>                  guestfile = os.path.realpath(guestfile)
>  
> @@ -105,7 +122,7 @@ python __anonymous() {
>                      raise bb.parse.SkipRecipe("ARM_AUTONOMY_HOST_IMAGE_EXTERN_GUESTS entry does not exist: " + guest)
>  
>                  # In case the file is a symlink make sure we use the destination
> -                d.appendVar('SRC_URI',  ' file://' + guestfile + ';guestname=' + guestname)
> +                d.appendVar('SRC_URI',  ' file://' + guestfile + ';guestname=' + guestname + ';guestcount=' + guestcount)
>              else:
>                  # we have a Yocto URL
>                  try:
> @@ -141,8 +158,15 @@ python add_extern_guests () {
>              # Add file extension if not there
>              if not dstname.endswith('.xenguest'):
>                  dstname += '.xenguest'
> +
>              if not bb.utils.copyfile(path, guestdir + '/' + dstname):
>                  bb.fatal("Fail to copy Guest file " + path)
> +
> +        if 'guestcount' in parm:
> +            guestcount = int(parm['guestcount']) + 1
> +
> +            for i in range(2, guestcount):
> +                os.symlink('./' + dstname, guestdir + '/' + dstname.replace('.xenguest', str(i) + '.xenguest'))
>  }
>  
>  IMAGE_PREPROCESS_COMMAND += "add_extern_guests; "
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index 8a54806..be2af32 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -1017,15 +1017,31 @@ case ${cmd} in
>      create)
>          guestfile="${arg1}"
>          guestname="${arg2}"
> -        if [ -z "${guestfile}" -o ! -f "${guestfile}" ]; then
> +        # guestfile invalid if empty
> +        if [ -z "${guestfile}" ]; then
>              log fatal "Usage ${this} create XENGUEST_FILE [NAME]"
>          fi
> +        # Set Guest name before resolving any symlinks
>          if [ -z "${guestname}" ]; then
>              guestname=$(basename ${guestfile} .xenguest)
> +            log info "guestname argument not provided, using '${guestname}'"
>          fi
> -
> +        # Check for and resolve symlink
> +        if [ -L "${guestfile}" ]; then
> +            errmsg="'${guestfile}' is a broken symlink"
> +            guestfile=$(readlink -e "${guestfile}")
> +            if [ -z "${guestfile}" ]; then
> +                log fatal "${errmsg}"
> +            else
> +                log info "Guestfile symlink resolved to path '${guestfile}'"
> +            fi
> +        fi
> +        # Check that guestfile is a valid file
> +        if [ ! -f "${guestfile}" ]; then
> +            log fatal "File '${guestfile}' not found"
> +        fi
> +        # Check if guest already exists
>          if [ -f ${XENGUEST_CONF_BASE}/guests/${guestname}/guest.cfg ]; then
> -            # Guest already exist
>              log fatal "Guest '${guestname}' already exists"
>          fi
>  
> -- 
> 2.17.1
> 

> 
> 
> 

