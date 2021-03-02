Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.9370.1614695323602081889
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Mar 2021 06:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=Vi3l+nlQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id s7so10207896qkg.4
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Mar 2021 06:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pDW9m6wy+eYetzJz0DCZBUvnxmBVFgXHG9ZPWITPH74=;
        b=Vi3l+nlQAm7Xb66HSh2AIvBBYGbyqdNjcUCchOr7Wy4OHC5lx/2yXh8o2JOSUw7jhT
         AMVMlC1co5UcpZ0EdzjoYowzI27RIZuBQP7b0bPAeJD1haHQrP0IbNcrMqtVyoihqhV8
         8tT8LXe2GijRF79MrFIVtYdWr9Dd/idCfXtgI6JuPsHg/clil73R32BEllnqbp5jV8F4
         cRD/7q8aje3GHjXyV0EoBYBE0Qrm0fV7FzW6BwStwjfYoRx1+YC7nRQYuav2pqxH+kXf
         gekPR4d378tDTu2pH3a8aa0HdBrU7vwl2rsaEcyJXpp6MWmOJIrw6iQAVxgtFO2Nm7vV
         /bKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pDW9m6wy+eYetzJz0DCZBUvnxmBVFgXHG9ZPWITPH74=;
        b=BsEelsiMepxq3fJfNxpHRnUeD8Zl4ytACJVzKop9r/s5ZSKVVwGpW5nZRAkHZhynyM
         w5j6uzjskPbsjaLtRdfXfSk9zBw3MO9P8CYZmjOsJEIZUy7dRZfHBjMyzvpzrGpOYETB
         kJ3zyQahqnq10LgyFXZJWsRUcyXj09iZSOUBXRGMUQKOJM3oHZrDS9KwoY+AHVK3Ag7j
         dd8cSS9p0DqzVoDd6AIAdNZRWFzF+ajxGcEOWAnMsPCCNEp/AghObfaDKmoB3C94LAf0
         LiPlKu1j0GHwDazEn8QuKlD/3bMF8A/vaViKvELe1j1vdLHjpfFFJSvgiKccT6UTv3zu
         uj9w==
X-Gm-Message-State: AOAM531TvdEjrTEC1C/LOyQw4jfzK7csPRKFFYRbI9AnqkkKleMvHcgj
	9/wWWfvcmPXKjKvcNWrdMGiHtg==
X-Google-Smtp-Source: ABdhPJyDA6+5OAL1knZcK+rOmZylMpIQMjjz6gH/POsSkEEPs0NTKGDkzxegy3JktpjwN2J/sYjEow==
X-Received: by 2002:a37:916:: with SMTP id 22mr20408476qkj.7.1614695322578;
        Tue, 02 Mar 2021 06:28:42 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:b028:6684:bbdb:6f5e])
        by smtp.gmail.com with ESMTPSA id c71sm6914753qkb.134.2021.03.02.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 06:28:41 -0800 (PST)
Date: Tue, 2 Mar 2021 09:28:40 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Peter Hoyes <peter.hoyes@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest: Fix issues raised by shellcheck
Message-ID: <20210302142839.GB25624@kudzu.us>
References: <20210301130451.1518834-1-peter.hoyes@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210301130451.1518834-1-peter.hoyes@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 01, 2021 at 01:04:51PM +0000, Peter Hoyes wrote:
> From: Peter Hoyes <Peter.Hoyes@arm.com>
> 
> Ignore issues in xenguest-manager and xenguest-mkimage as these
> will soon be rewritten.
> 
> Issue-Id: SCM-1526
> Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
> Change-Id: I733b4bfaaa5002f7a64c577e16548af62c425ebf
> ---

Applied to master.

Thanks,
Jon

>  .../xenguest/files/kea-restore-default-config |  2 +-
>  .../xenguest/files/network-bridge.sh.in       |  4 ++--
>  .../xenguest/files/xenguest-init              | 22 +++++++++----------
>  .../xenguest/files/xenguest-network-bridge.in |  2 +-
>  .../files/xenguest-network-init-post.sh       | 11 +++++-----
>  5 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config
> index 424fd0a..9776ddf 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/kea-restore-default-config
> @@ -22,7 +22,7 @@ case "$1" in
>    *)
>          # do not advertise unreasonable commands that there is no reason
>          # to use with this device
> -        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
> +        echo "Usage: $0 {start|stop|status|restart|force-reload}"
>          exit 1
>  esac
>  
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> index 3f87b76..e697f7e 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> @@ -10,11 +10,11 @@ BRIDGE_NAME="###BRIDGE_NAME###"
>  
>  case "${XENGUEST_NETWORK_TYPE:=}" in
>      nat)
> -        echo "vif = ['script=vif-nat']" >> ${guestcfgfile}
> +        echo "vif = ['script=vif-nat']" >> "${guestcfgfile:?}"
>          log info "Network type is NAT"
>          ;;
>      bridge)
> -        echo "vif = ['script=vif-bridge,bridge=${BRIDGE_NAME}']" >> ${guestcfgfile}
> +        echo "vif = ['script=vif-bridge,bridge=${BRIDGE_NAME}']" >> "${guestcfgfile:?}"
>          log info "Network type is bridge: ${BRIDGE_NAME}"
>          ;;
>      *)
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> index c6b0c83..5862cb9 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> @@ -25,19 +25,19 @@ case "$1" in
>          echo "Starting xenguest"
>  
>          # Create unconfigured guests
> -        if [ -d ${XENGUEST_GUEST_DIR} ]; then
> -            for f in $(find ${XENGUEST_GUEST_DIR} -name "*.xenguest" \
> -                -exec basename {} .xenguest \;); do
> -                if [ ! -f ${XENGUEST_CONF_BASE}/guests/${f}/guest.cfg ]; then
> +        if [ -d "${XENGUEST_GUEST_DIR}" ]; then
> +            shopt -s nullglob
> +            for path in "${XENGUEST_GUEST_DIR}"/*.xenguest; do
> +                f=$(basename "${path}" .xenguest)
> +                if [ ! -f "${XENGUEST_CONF_BASE}/guests/${f}/guest.cfg" ]; then
>                      # Check if this guest should be auto booted
>                      autoboot=$(/usr/bin/xenguest-mkimage dump-paramsconfig \
> -                        ${XENGUEST_GUEST_DIR}/${f}.xenguest | \
> +                        "${path}" | \
>                          grep GUEST_AUTOBOOT | sed -e "s,.*=,," | tr -d '"')
>                      if [ "$autoboot" = "0" ]; then
>                          echo "Do not create $f, autoboot disabled"
>                      else
> -                        /usr/bin/xenguest-manager create \
> -                            ${XENGUEST_GUEST_DIR}/${f}.xenguest
> +                        /usr/bin/xenguest-manager create "${path}"
>                          # Update guestlist
>                          if [ $? -eq 0 ]; then
>                              guestlist="${guestlist} ${f}"
> @@ -49,11 +49,11 @@ case "$1" in
>          if [ -n "${guestlist}" ]; then
>              for f in ${guestlist}; do
>                  GUEST_AUTOBOOT="1"
> -                if [ -f ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg ]; then
> -                    source ${XENGUEST_CONF_BASE}/guests/${f}/params.cfg
> +                if [ -f "${XENGUEST_CONF_BASE}/guests/${f}/params.cfg" ]; then
> +                    source "${XENGUEST_CONF_BASE}/guests/${f}/params.cfg"
>                  fi
>                  if [ "${GUEST_AUTOBOOT}" = "1" ]; then
> -                    /usr/bin/xenguest-manager start ${f}
> +                    /usr/bin/xenguest-manager start "${f}"
>                  fi
>              done
>          else
> @@ -68,7 +68,7 @@ case "$1" in
>          # update guest list
>          guestlist=$(xenguest-manager status | grep Running | cut -d ":" -f1)
>          for f in ${guestlist}; do
> -            xenguest-manager shutdown ${f} --kill
> +            xenguest-manager shutdown "${f}" --kill
>          done
>          ;;
>    reload)
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
> index 2278b80..54b5a2f 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-bridge.in
> @@ -36,7 +36,7 @@ case "$1" in
>    *)
>          # do not advertise unreasonable commands that there is no reason
>          # to use with this device
> -        echo $"Usage: $0 {start|stop|status|restart|force-reload}"
> +        echo "Usage: $0 {start|stop|status|restart|force-reload}"
>          exit 1
>  esac
>  
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
> index ce5e6de..b63c6a2 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-network-init-post.sh
> @@ -11,19 +11,20 @@ set +u
>  #
>  
>  check_if_vif_is_ready() {
> -    ret=($(xl network-list "${guestname}" | grep  "${1}"))
> -    # ${ret[4]} is network interface status value
> +    ret=$(xl network-list "${guestname:?}" | grep  "${1}" \
> +        | tr -s ' ' | cut -d' ' -f5)
> +    # ${ret} is network interface status value
>      # 1 means vif is not ready
>      # 4 means vif is ready
> -    [ "${ret[4]}" = "4" ] && return 0
> +    [ "${ret}" = "4" ] && return 0
>      return 1
>  }
>  
>  case "${XENGUEST_NETWORK_TYPE:-}" in
>      nat)
> -        vif_name="$(xl network-list ${guestname} | grep -o vif.*)"
> +        vif_name="$(xl network-list "${guestname:?}" | grep -o "vif.*")"
>  
> -        for try in {1..20}
> +        for try in $(seq 20)
>          do
>              if check_if_vif_is_ready "${vif_name}"; then
>                  claim_lock "vif-nat-kea"
> -- 
> 2.25.1
> 

> 
> 
> 

