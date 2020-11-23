Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.36089.1606141594448867230
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 06:26:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Kv4b6yS5;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id y197so17051821qkb.7
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Nov 2020 06:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HhP1uSFu6qSat+wjeG1rg0VzX/2uZPZxI6KZ3xut1kI=;
        b=Kv4b6yS50Mc5g0lyDa8IjRsHtYvv8bRRCn9MpK/5aZnUcYihsvmO5AA+ms4PLgc/eE
         HHeBSJfqJd5Mv+APj8kmMHGSfxuyKalCu7yAY1xifopQZ5PW2Kodgxr1fSPAxsubh38R
         QmsPCus0ZzraTwaAIMZ9/WcDo7ODzhN66NKY1fDCzrAC9ezeUCBYES3glN9ttQtERmSP
         oXkJBlz+diurDd/scXRj0pG/f7WKEGL48Wc5+OYfwLadTbRigBZGL/mKlt8UP1U9I0+K
         0dx45DejQ+3xkOysLEgUrQSqhLktI5q3AVt3t+sClWXD5cs//68bKwOW117nF21PGikW
         n6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HhP1uSFu6qSat+wjeG1rg0VzX/2uZPZxI6KZ3xut1kI=;
        b=RxN5DLqDxjZjDy9L4KQmKIbWHgp2mGW33FR6U/e3zxH3IrHggiWoqpWlOPjdnPYcrH
         eGol7fpm7qP99biCY0FRNaPUxEEowyjWaI8AF8Y0kPSIA4h9QdK19+GR2WjFQ5g6ErB8
         +gIQsKGG8ZPyD/iK+sO3c7ys6mdp/80pSHN1eZrGnVnYPGAD08/5ebAHT6gDf0BFVt3z
         rAEP8iL4uElSG8HnS4/1Ec1IEv+9fFXCS/oimhQ5//tcIB4nIKIxCZpqLMGzRamM3r/r
         f6o+COvwoymMTi/MTE+inpK1nnHyb77OFCabfNBS1zXj9tlZErTJyqY+DHYy2Ii3RUmX
         omEw==
X-Gm-Message-State: AOAM533uWIESQEdsoe4Nd2bsTyyutcHkyl3IWsdfMMbHdzlMWbP2lq1Y
	lpOkvSOHO7hwHbogzo6XVUFOiEqJN49wlA==
X-Google-Smtp-Source: ABdhPJyHl7DPHwol4gPPiqS8iE+sbBRjKXsFvOft3IaizhbtCk6P3IkOOrQxUvP/l85WUuxcrRdw3w==
X-Received: by 2002:a37:9fcc:: with SMTP id i195mr1182003qke.411.1606141593552;
        Mon, 23 Nov 2020 06:26:33 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:7160:191d:209b:6e92])
        by smtp.gmail.com with ESMTPSA id h125sm9081195qkc.36.2020.11.23.06.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 06:26:33 -0800 (PST)
Date: Mon, 23 Nov 2020 09:26:31 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-manager: Private xenguest-manager functions
Message-ID: <20201123142631.GB1595@kudzu.us>
References: <20201123133125.24226-1-Nathan.Dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201123133125.24226-1-Nathan.Dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 23, 2020 at 01:31:25PM +0000, Nathan Dunne wrote:
> Ensure that init scripts sourced on guest start cannot execute functions
> from the parent script. This is done using a check for the BASH_SUBSHELL
> variable to see the depth of execution.
> 
> An error will be thrown if any init script attempts to execute a
> function from xenguest-manager
> 
> Issue-Id: SCM-1623
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: I87fee51d03a64d99728a7eca1ca789ec7293096b

Pushed to master.

Thanks,
Jon

> ---
>  .../xenguest/files/xenguest-manager           | 44 +++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index edd9a89..33ec40f 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -54,7 +54,24 @@ with ACTION being one of:
>  EOF
>  }
>  
> +# Ensure init scripts in subshells do not call private functions
> +function check_private()
> +{
> +
> +    # Return:
> +    # 0 - success
> +    # 1 - failure
> +
> +    if [ $BASH_SUBSHELL -ne 0 ]; then
> +        echo "Attempted to execute private function ${FUNCNAME[1]} in subshell!"
> +        exit 1
> +    fi
> +}
> +
>  is_integer() {
> +
> +    check_private
> +
>      if ! [[ "${1}" =~ ^[0-9]+$ ]]; then
>          >&2 echo "error: invalid number '${1}'"; exit 1
>      fi
> @@ -62,6 +79,9 @@ is_integer() {
>  
>  # check size and convert it to MB, e.g '1[G]' => '1000M'
>  check_size() {
> +
> +    check_private
> +
>      local disksize="${1}"
>  
>      [ -n "${disksize}" ] || disksize="invalid"
> @@ -101,6 +121,8 @@ function xenguest_volume_init()
>      # 0 - success
>      # 1 - failure
>  
> +    check_private
> +
>      if [ -z "${XENGUEST_VOLUME_DEVICE:-}" -o \
>          ! -b ${XENGUEST_VOLUME_DEVICE:-} ]; then
>          echo "${PREF} Invalid volume device in configuration: ${XENGUEST_VOLUME_DEVICE:-}"
> @@ -154,6 +176,8 @@ function xenguest_volume_init()
>  # Detach a disk we attached to xen
>  function xenguest_detach_disk()
>  {
> +    check_private
> +
>      echo "xl block-detach 0 \$\(xl block-list 0 | " \
>          "grep \"domain/0\" | awk '{print \$1}'\)" \
>              >> ${LOGFILE} 2>&1
> @@ -177,6 +201,8 @@ function xenguest_disk_init()
>      # 1 - failed at guest disk preparation
>      # 2 - failed at guest disk creation
>  
> +    check_private
> +
>      guestname="$1"
>      guestfile="$2"
>      devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
> @@ -454,6 +480,7 @@ function xenguest_disk_init()
>  
>  function xenguest_guest_create()
>  {
> +    check_private
>      guestfile="$1"
>      guestname="$2"
>  
> @@ -502,6 +529,8 @@ function xenguest_guest_create()
>  
>  function xenguest_guest_remove()
>  {
> +    check_private
> +
>      guestname="$1"
>      devname="/dev/${XENGUEST_VOLUME_NAME}/${guestname}"
>  
> @@ -526,6 +555,8 @@ function xenguest_guest_remove()
>  
>  function xenguest_guest_start()
>  {
> +    check_private
> +
>      guestname="${1}"
>      guestdir=${XENGUEST_CONF_BASE}/guests/${guestname}
>  
> @@ -560,7 +591,8 @@ function xenguest_guest_start()
>                  rm -f ${guestcfgfile}
>                  popd > /dev/null 2>&1
>                  echo "Error in init script $f" >> ${LOGFILE} 2>&1
> -                echo "${PREF} Error during pre init script of ${guestname}"
> +                echo "${PREF} Error during pre init script $(basename $f) of ${guestname}"
> +                echo "${PREF} Check the log: ${LOGFILE} for more information"
>                  exit 1
>              fi
>          else
> @@ -589,7 +621,8 @@ function xenguest_guest_start()
>                  xl destroy ${guestname} >> ${LOGFILE} 2>&1
>                  popd > /dev/null 2>&1
>                  echo "Error in init script $f" >> ${LOGFILE} 2>&1
> -                echo "${PREF} Error during init script of ${guestname}"
> +                echo "${PREF} Error during init script $(basename $f) of ${guestname}"
> +                echo "${PREF} Check the log: ${LOGFILE} for more information"
>                  exit 1
>              fi
>          else
> @@ -618,7 +651,8 @@ function xenguest_guest_start()
>                  xl destroy ${guestname} >> ${LOGFILE} 2>&1
>                  popd > /dev/null 2>&1
>                  echo "Error in init script $f" >> ${LOGFILE} 2>&1
> -                echo "${PREF} Error during post init script of ${guestname}"
> +                echo "${PREF} Error during post init script $(basename $f) of ${guestname}"
> +                echo "${PREF} Check the log: ${LOGFILE} for more information"
>                  exit 1
>              fi
>          else
> @@ -632,6 +666,8 @@ function xenguest_guest_start()
>  
>  function xenguest_guest_stop()
>  {
> +    check_private
> +
>      guestname="${1}"
>      echo "xl shutdown ${guestname}" >> ${LOGFILE} 2>&1
>      xl shutdown ${guestname} >> ${LOGFILE} 2>&1
> @@ -643,6 +679,8 @@ function xenguest_guest_stop()
>  
>  function check_guest_arg()
>  {
> +    check_private
> +
>      cmd="${1}"
>      guestname="${2:-}"
>      if [ -z "${guestname:-}" ]; then
> -- 
> 2.17.1
> 

> 
> 
> 

