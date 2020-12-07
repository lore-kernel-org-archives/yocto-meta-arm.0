Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web08.90.1607365958543995808
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 10:32:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=BGwI/ja3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id x13so6973117qvk.8
        for <meta-arm@lists.yoctoproject.org>; Mon, 07 Dec 2020 10:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sSXtw8nxjd/sh1I4Km49Z8DhkBFbCfD27j3ESnc+H/E=;
        b=BGwI/ja3fUGKzIte5R/+DSJp+wjFZfCj1X1Yzridy5ygCjTOZHaBzZAWQKRiS1xNft
         9byyaOI3dH9876mmoVtAHk4YLShws+KS073cBTZcZr4M8439Yevo5ertetI9WWiqHdq7
         CI3V7kHbKxLJOpdYlIKpFRdx1oymMwnrxExffeEKZcyaAVjJkQcXZbzv3fy7Lhlhlcn+
         9pG2pfqXs99TAqZ5/WV5UMqZ31phg07aw0GFLhZ3TnQtrIA+6wtKQNA6bKrKxpiD+b//
         WwVD9n2a+W31rYWhmdbWUTaJZt8iNE6+dw6kaLQisgtIOp+DXv1LPRy2pRCQk7C8nhtg
         kviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sSXtw8nxjd/sh1I4Km49Z8DhkBFbCfD27j3ESnc+H/E=;
        b=Fiky+b23vdOa/7lXA0VLnY9NKwrVO/CFWtlYuPtHiFCmqs1cvYOGwFztfYjW9DgZ/8
         wqexYpEc181MyMSTjRL4ye6fLffNaDZ2Rlz40zUNZDNgADSYl7+MAZfGjGZewZJFonMZ
         5w3vbVO4dMFudx6tPXf5M4fbox7j12BRzLvygkNgSBkR3GTHS3kpxZqtXWVbjn/38QcZ
         3PUpXM6eDlSXM2k7TQZfmpyeVFswfZva7g0UEpYutPPxzT/JCaVkoNvP4UGvygqD9jdF
         Acuiim51/A4+++5It8KGli6c3auHO0S+OoL+VIrzOl99EvPBXsQ4tbLt+3F1Jz71o5hx
         RXEA==
X-Gm-Message-State: AOAM533/O8Zg/NV82MHFx6atWX6Qn9KCe0vyW/1pABI/0PA81+owG6UM
	12BCP4lmJev85lLBWD4ajRchEw==
X-Google-Smtp-Source: ABdhPJwZ675ydPaZTRo6+xsiplMCfkjGXpoY2R0mbLoA2uH5iM9CHQKF6INvhQrZcfdwIm9XP5N4/A==
X-Received: by 2002:a0c:e608:: with SMTP id z8mr22973886qvm.2.1607365957551;
        Mon, 07 Dec 2020 10:32:37 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:d96a:5ab0:517:f408])
        by smtp.gmail.com with ESMTPSA id a83sm12084170qkc.77.2020.12.07.10.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 10:32:37 -0800 (PST)
Date: Mon, 7 Dec 2020 13:32:35 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Kamil Dziezyk <kamil.dziezyk@arm.com>
Subject: Re: [meta-arm] [PATCH 1/4] arm-autonomy/xenguest-tools: add multiple disk devices support
Message-ID: <20201207183234.GA16303@kudzu.us>
References: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <18d45b3d900892dde8c466d582a5027a25c21c84.1606996678.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 03, 2020 at 11:59:21AM +0000, Diego Sueiro wrote:
> From: Kamil Dziezyk <kamil.dziezyk@arm.com>
> 
> With this patch user can set DISK_DEVICE for guest image.
> If guest disk configuration contains DISK_DEVICE setting,
> xenguest-manager uses that disk for this guest, insted of default one,
> that is set with XENGUEST_VOLUME_DEVICE in xenguest-manager.conf file.
> DISK_DEVICE is not set by deafult.
> 
> Change-Id: If400850f60097d38339e76a3d18fc0e2b927f3a0
> Issue-Id: SCM-1513
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Series pulled into master.

Thanks,
Jon

> ---
>  .../classes/xenguest-image.bbclass            |   8 ++
>  .../documentation/xenguest-mkimage.md         |   5 +
>  .../xenguest/files/xenguest-manager           | 104 +++++++++++-------
>  .../xenguest/xenguest-manager.bb              |   2 +-
>  4 files changed, 79 insertions(+), 40 deletions(-)
> 
> diff --git a/meta-arm-autonomy/classes/xenguest-image.bbclass b/meta-arm-autonomy/classes/xenguest-image.bbclass
> index 8c6b141..5e5c4c7 100644
> --- a/meta-arm-autonomy/classes/xenguest-image.bbclass
> +++ b/meta-arm-autonomy/classes/xenguest-image.bbclass
> @@ -43,6 +43,9 @@ XENGUEST_IMAGE_KERNEL ??= "Image"
>  # be included in the xenguest image)
>  XENGUEST_IMAGE_DISK_SIZE ??= "${@ '4' if not d.getVar('INITRAMFS_IMAGE') else '0'}"
>  
> +# set empty partition to be used by xenguest-manager for this image
> +XENGUEST_IMAGE_DISK_DEVICE ??= ""
> +
>  #
>  # XENGUEST_IMAGE_DISK_PARTITIONS is used to describe the partitions to setup
>  # and their content.
> @@ -142,6 +145,11 @@ xenguest_image_create() {
>                      call_xenguest_mkimage update --disk-add-part=$arg
>                  done
>              fi
> +            diskdevice="${XENGUEST_IMAGE_DISK_DEVICE}"
> +            if [ -n "$diskdevice" ]; then
> +                call_xenguest_mkimage update --disk-device="${diskdevice}"
> +            fi
> +
>              ;;
>      esac
>  
> diff --git a/meta-arm-autonomy/documentation/xenguest-mkimage.md b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> index d7baa2e..fd142b7 100644
> --- a/meta-arm-autonomy/documentation/xenguest-mkimage.md
> +++ b/meta-arm-autonomy/documentation/xenguest-mkimage.md
> @@ -66,6 +66,11 @@ The file contains the following entries:
>    and extract CONTENT as initial partition content (.tar[.gz|.xz|.bz2] file
>    or img[.gz|.bz2] file to be dumped in the partition).
>    FS and CONTENT can be empty.
> +- `DISK_DEVICE=X`: disk or partition to be used by lvm. Setting this option
> +  allows to bind guest disk with any partition or disk available on host,
> +  e.g. /dev/sda3 or /dev/sdb.
> +  This variable is not set by default, but if set, it overrides disk settings
> +  inside xenguest-manager.conf - 'XENGUEST_VOLUME_DEVICE'.
>  
>  The disk-files contain files to be used for initializing the disk partitions
>  content. Those should be used to create a LVM or a physical disk and initialize
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index cc55b26..fafe4a0 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -116,51 +116,56 @@ function xenguest_volume_init()
>      # Return:
>      # 0 - success
>      # 1 - failure
> -
> -    check_private
> -
> -    if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
> -        ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
> -        echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
> -        return 1
> +    local diskdevice
> +    local volumename
> +
> +    if [ -z "${DISK_DEVICE}" ]; then
> +        # By default guest is using disk defined inside xenguest-manager.conf
> +        diskdevice="${XENGUEST_VOLUME_DEVICE}"
> +        volumename="${XENGUEST_VOLUME_NAME}"
> +    else
> +        # If guest configuration contains custom disk setting,
> +        # overwrite default one
> +        diskdevice="${DISK_DEVICE}"
> +        volumename="vg-xen-$(basename ${diskdevice})"
>      fi
>  
> -    if [ -z "${XENGUEST_VOLUME_NAME:-}" ]; then
> -        echo "${PREF} No volume name in configuration, using vg-xen..."
> -        XENGUEST_VOLUME_NAME="vg-xen"
> +    if [ -z "${diskdevice}" -o ! -b "${diskdevice}" ]; then
> +        echo "${PREF} Invalid volume device in configuration: ${diskdevice}"
> +        return 1
>      fi
>  
> -    pvs ${XENGUEST_VOLUME_DEVICE} > /dev/null 2>&1
> +    pvs "${diskdevice}" > /dev/null 2>&1
>      if [ $? -ne 0 ]; then
>          # Check if there is no filesystem in the block device
> -        echo "lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
> -        filesystem=$(lsblk -n -o FSTYPE ${XENGUEST_VOLUME_DEVICE} 2>> ${LOGFILE})
> +        echo "lsblk -n -o FSTYPE ${diskdevice}" >> ${LOGFILE} 2>&1
> +        filesystem=$(lsblk -n -o FSTYPE "${diskdevice}" 2>> ${LOGFILE})
>          if [[ $? -eq 0 && -z "$filesystem" ]]; then
> -            echo "${PREF} Initialize lvm on ${XENGUEST_VOLUME_DEVICE}"
> -            echo "pvcreate -f ${XENGUEST_VOLUME_DEVICE}" >> ${LOGFILE} 2>&1
> -            pvcreate -f ${XENGUEST_VOLUME_DEVICE} >> ${LOGFILE} 2>&1
> +            echo "${PREF} Initialize lvm on ${diskdevice}"
> +            echo "pvcreate -f ${diskdevice}" >> ${LOGFILE} 2>&1
> +            pvcreate -f "${diskdevice}" >> ${LOGFILE} 2>&1
>              if [ $? -ne 0 ]; then
>                  echo "${PREF} Error: initialing lvm on " \
> -                     "${XENGUEST_VOLUME_DEVICE} failed." | tee -a ${LOGFILE}
> +                     "${diskdevice} failed." | tee -a ${LOGFILE}
>                  return 1
>              fi
>          else
>              [ -z "$filesystem" ] || \
> -                echo "${PREF} Error: The ${XENGUEST_VOLUME_DEVICE} is already " \
> +                echo "${PREF} Error: The ${diskdevice} is already " \
>                       "formatted as $filesystem." | tee -a ${LOGFILE}
>              return 1
>          fi
>      fi
>  
> -    vgs ${XENGUEST_VOLUME_NAME} > /dev/null 2>&1
> +    vgs "${volumename}" > /dev/null 2>&1
>      if [ $? -ne 0 ]; then
> -        echo "${PREF} Create ${XENGUEST_VOLUME_NAME} volume"
> -        echo "vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE}" \
> +        echo "${PREF} Create ${volumename} volume"
> +        echo "vgcreate ${volumename} ${diskdevice}" \
>              >> ${LOGFILE} 2>&1
> -        vgcreate ${XENGUEST_VOLUME_NAME} ${XENGUEST_VOLUME_DEVICE} \
> +        vgcreate "${volumename}" "${diskdevice}" \
>              >> ${LOGFILE} 2>&1
>          if [ $? -ne 0 ]; then
> -            echo "${PREF} Error: creating ${XENGUEST_VOLUME_NAME} volume " \
> +            echo "${PREF} Error: creating ${volumename} volume " \
>                   "failed."  | tee -a ${LOGFILE}
>              return 1
>          fi
> @@ -201,9 +206,19 @@ function xenguest_disk_init()
>  
>      guestname="$1"
>      guestfile="$2"
> -    devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
>  
>      source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
> +    if [ -z "${DISK_DEVICE}" ]; then
> +        # By default guest is using disk defined inside xenguest-manager.conf
> +        diskdevice="${XENGUEST_VOLUME_DEVICE}"
> +        volumename="${XENGUEST_VOLUME_NAME}"
> +    else
> +        # If guest configuration contains custom disk setting,
> +        # overwrite default one
> +        diskdevice="${DISK_DEVICE}"
> +        volumename="vg-xen-$(basename ${diskdevice})"
> +    fi
> +    devname="/dev/${volumename}/${guestname}"
>  
>      DISK_SIZE=$(check_size "${DISK_SIZE}")
>      if [ -z "${DISK_SIZE}" ] || [ "${DISK_SIZE}" = "0M" ]; then
> @@ -224,11 +239,11 @@ function xenguest_disk_init()
>  
>  
>      # Remove volume if it already exist
> -    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE} 2>&1
> -    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
> +    echo "lvs ${volumename}/${guestname}"  >> ${LOGFILE} 2>&1
> +    lvs "${volumename}/${guestname}" >> ${LOGFILE} 2>&1
>      if [ $? -eq 0 ]; then
>          echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
> -        lvremove -y ${devname} >> ${LOGFILE} 2>&1
> +        lvremove -y "${devname}" >> ${LOGFILE} 2>&1
>          if [ $? -ne 0 ]; then
>              echo "${PREF} Error removing volume ${guestname}"
>              return 1
> @@ -236,9 +251,9 @@ function xenguest_disk_init()
>      fi
>  
>      # Create volume
> -    echo "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${XENGUEST_VOLUME_NAME}" \
> +    echo "lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${volumename}" \
>          >> ${LOGFILE} 2>&1
> -    lvcreate -y -L ${DISK_SIZE} -n ${guestname} ${XENGUEST_VOLUME_NAME} \
> +    lvcreate -y -L "${DISK_SIZE}" -n "${guestname}" "${volumename}" \
>          >> ${LOGFILE} 2>&1
>      if [ $? -ne 0 ]; then
>          echo "${PREF} Error creating volume ${guestname}"
> @@ -247,7 +262,7 @@ function xenguest_disk_init()
>  
>      # Add partition table
>      echo "parted -s ${devname} mklabel msdos" >> ${LOGFILE} 2>&1
> -    parted -s ${devname} mklabel msdos >> ${LOGFILE} 2>&1
> +    parted -s "${devname}" mklabel msdos >> ${LOGFILE} 2>&1
>      if [ $? -ne 0 ]; then
>          echo "${PREF} Error creating partition table on ${guestname}"
>          return 1
> @@ -256,8 +271,8 @@ function xenguest_disk_init()
>      # Setup disk name in xen configuration
>      echo "xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname}" \
>          "--xen-disk=${devname}" >> ${LOGFILE} 2>&1
> -    xenguest-mkimage update ${XENGUEST_CONF_BASE}/guests/${guestname} \
> -        --xen-disk=${devname} >> ${LOGFILE} 2>&1
> +    xenguest-mkimage update "${XENGUEST_CONF_BASE}/guests/${guestname}" \
> +        "--xen-disk=${devname}" >> ${LOGFILE} 2>&1
>      if [ $? -ne 0 ]; then
>          echo "${PREF} Error setting disk in xen configuration"
>          return 1
> @@ -311,8 +326,8 @@ function xenguest_disk_init()
>              # Create partition
>              echo "parted -s ${devname} unit MB mkpart primary ${partstart}" \
>                  "${partend}" >> ${LOGFILE} 2>&1
> -            parted -s ${devname} unit MB mkpart primary ${partstart} \
> -                ${partend} >> ${LOGFILE} 2>&1
> +            parted -s "${devname}" unit MB mkpart primary "${partstart}" \
> +                "${partend}" >> ${LOGFILE} 2>&1
>              if [ $? -ne 0 ]; then
>                  echo "${PREF} Error adding partition ${part}"
>                  return 1
> @@ -346,7 +361,7 @@ function xenguest_disk_init()
>  
>              # Attach disk to xen
>              echo "xl block-attach 0 phy:${devname} xvda w" >> ${LOGFILE} 2>&1
> -            xl block-attach 0 phy:${devname} xvda w >> ${LOGFILE} 2>&1
> +            xl block-attach 0 "phy:${devname}" xvda w >> ${LOGFILE} 2>&1
>              if [ $? -ne 0 ]; then
>                  echo "${PREF} Error attaching partition ${part}"
>                  return 1
> @@ -528,16 +543,27 @@ function xenguest_guest_remove()
>      check_private
>  
>      guestname="$1"
> -    devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
> +    source ${XENGUEST_CONF_BASE}/guests/${guestname}/disk.cfg
> +    if [ -z "${DISK_DEVICE}" ]; then
> +        # By default guest is using disk defined inside xenguest-manager.conf
> +        diskdevice="${XENGUEST_VOLUME_DEVICE}"
> +        volumename="${XENGUEST_VOLUME_NAME}"
> +    else
> +        # If guest configuration contains custom disk setting,
> +        # overwrite default one
> +        diskdevice="${DISK_DEVICE}"
> +        volumename="vg-xen-$(basename ${diskdevice})"
> +    fi
> +    devname="/dev/${volumename}/${guestname}"
>  
>      # check if guest had a volume
> -    echo "lvs ${XENGUEST_VOLUME_NAME}/${guestname}"  >> ${LOGFILE} 2>&1
> -    lvs ${XENGUEST_VOLUME_NAME}/${guestname} >> ${LOGFILE} 2>&1
> +    echo "lvs ${volumename}/${guestname}"  >> ${LOGFILE} 2>&1
> +    lvs ${volumename}/${guestname} >> ${LOGFILE} 2>&1
>      if [ $? -eq 0 ]; then
>          # Remove guest volume
>          echo "${PREF} Removing ${guestname} volume. This might take a while..."
>          echo "lvremove -y ${devname}" >> ${LOGFILE} 2>&1
> -        lvremove -y ${devname} >> ${LOGFILE} 2>&1
> +        lvremove -y "${devname}" >> ${LOGFILE} 2>&1
>          if [ $? -ne 0 ]; then
>              echo "${PREF} Error removing volume ${guestname}"
>              exit 1
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> index 9c29bde..c55d879 100644
> --- a/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/xenguest-manager.bb
> @@ -17,7 +17,7 @@ S = "${WORKDIR}"
>  # Please refer to documentation/xenguest-manager.md for documentation on those
>  # parameters
>  XENGUEST_MANAGER_VOLUME_DEVICE ?= "/dev/sda2"
> -XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen"
> +XENGUEST_MANAGER_VOLUME_NAME ?= "vg-xen-$(basename ${XENGUEST_MANAGER_VOLUME_DEVICE})"
>  XENGUEST_MANAGER_GUEST_DIR ?= "${datadir}/guests/"
>  
>  # We add an init script to create and start guests automatically
> -- 
> 2.17.1
> 

> 
> 
> 

