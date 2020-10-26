Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
 by mx.groups.io with SMTP id smtpd.web11.3876.1603745110766344473
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Oct 2020 13:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=OBPQKX6L;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.193, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f193.google.com with SMTP id b18so6023627qkc.9
        for <meta-arm@lists.yoctoproject.org>; Mon, 26 Oct 2020 13:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bG9ggReDvRHK0ZKLJFr8YVpARhSpJ/vZNiLjHh1uM78=;
        b=OBPQKX6LKE+Oq9kuuq+TW+zBevBSZ85+r0+78PeI1/S/6SuWIWf3uepUOk5Hp5nTjA
         ho8mYdEBeZVbO6Csp3+jMFbNN3s4yWe8/MBsgV9YyB3XarYPoEO7TLBGKPZ704tD/05R
         6xd76duhHRC2UROCHmq0BICmqP02+K60VNrXY8/SVVlguBD0FW1fB+Cbt5pQw7OLhH3w
         I6+8qd2tYUWqlA4A1jzxasVdb+e2GPtzOA5ZdwxZ9ARRB9utzoUiuVHngtE43BdBMUWa
         4yE8vbx/rLqm5ByqY4IqBTIZ3/M9o3XcE6WUe0XD0cyQCF8opPKw1i1KRViWXuGAt4VS
         VsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bG9ggReDvRHK0ZKLJFr8YVpARhSpJ/vZNiLjHh1uM78=;
        b=m99fMSGsemjs/Hp6HMLKRE4LHRlPFeghRC2nrcY01hFZWIISIjzSQtYVCNZE+9+6/9
         X1xY0P/R3V9y60fJKS7H6rBeIUSeVNVHjki5RUe7FjuZWK0Z9P0ae77+TeEwCvTg1MNx
         FuAqLOPesCulAw+oU/sj1+Xwxcebu6+nJbleAYTHkOzT5WQkIcCrmqJWVf7cI55cfr9E
         JyE9gLXE3DScgC2BYtLDuvpuC+3Cgd4d+QfcUqDkJ3//9DOZmsArVnSWhZ4ikIuVeeam
         b8sb3sr8ADzKKQoCuVeOb/65L5uGdSEtKaNoMQXss/a6O5p8Y9NL07aMdjE0vYTE7SjM
         Wgaw==
X-Gm-Message-State: AOAM5305SpzQJRMWtZ3jRKKCwwmyy3j9Ob7etvSfgBVCn5E111XDfOii
	ER0tnxscXfnU72G362EQkfoeKQ==
X-Google-Smtp-Source: ABdhPJwFESM00q3HTNrNEIKJVfb6TfsYjdmJ5wAHqU0vL0DRdKVLx9OEf+TsGTnxSg1mS5kWvj4viA==
X-Received: by 2002:a05:620a:d:: with SMTP id j13mr17174708qki.127.1603745109779;
        Mon, 26 Oct 2020 13:45:09 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id s16sm5566873qtq.80.2020.10.26.13.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 13:45:09 -0700 (PDT)
Date: Mon, 26 Oct 2020 16:45:04 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: Re: [meta-arm] [PATCH 1/2] arm-autonomy/xenguest-manager: source init scripts
Message-ID: <20201026204503.GC14261@kudzu.us>
References: <a71da05f15122d0b28f6b6186c67f79dcd8ea973.1603710589.git.diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <a71da05f15122d0b28f6b6186c67f79dcd8ea973.1603710589.git.diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 26, 2020 at 11:12:22AM +0000, Diego Sueiro wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> source init scripts in xenguest manager instead of executing
> directly, so they can immediately access functions and
> variables from the parent script.
> 
> Also added a check that init scripts are executable, and will
> skip if not.
> 
> Change-Id: Ie6bbb1b480a7bfe5af095addcf1aefd122b57c50
> Issue-Id: SCM-1587
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>

Series applied to master.

Thanks,
Jon

> ---
>  .../documentation/xenguest-manager.md              | 38 +++++++++++-
>  .../xenguest/files/network-bridge.sh.in            |  9 ++-
>  .../xenguest/files/xenguest-manager                | 68 ++++++++++++++--------
>  3 files changed, 82 insertions(+), 33 deletions(-)
> 
> diff --git a/meta-arm-autonomy/documentation/xenguest-manager.md b/meta-arm-autonomy/documentation/xenguest-manager.md
> index 387af94..93453bf 100644
> --- a/meta-arm-autonomy/documentation/xenguest-manager.md
> +++ b/meta-arm-autonomy/documentation/xenguest-manager.md
> @@ -48,16 +48,16 @@ project compilation (those can be set in your project local.conf, for example).
>  
>  The following parameters are available:
>  
> -- XENGUEST_MANAGER_VOLUME_DEVICE: This is the device path used by the 
> +- XENGUEST_MANAGER_VOLUME_DEVICE: This is the device path used by the
>    xenguest-manager on the device to create LVM disks when guests have a disk
>    configuration.
>    This is set by default to "/dev/sda2".
>  
> -- XENGUEST_MANAGER_VOLUME_NAME: This is the LVM volume name that the 
> +- XENGUEST_MANAGER_VOLUME_NAME: This is the LVM volume name that the
>    xenguest-manager will create and use to create guest LVM disks.
>    This is set by default to "vg-xen".
>  
> -- XENGUEST_MANAGER_GUEST_DIR: This is the directory on Dom0 where the 
> +- XENGUEST_MANAGER_GUEST_DIR: This is the directory on Dom0 where the
>    xenguest-manager will look for xenguest images to create during init. That's
>    the place where xenguest images can be added to have them automatically
>    created during next Dom0 boot. The xenguests found there will only be created
> @@ -65,3 +65,35 @@ The following parameters are available:
>    name).
>    This is set by default to "/usr/share/guests".
>  
> +Init scripts
> +------------
> +
> +Shell scripts can be executed on the host when a guest is started. Depending on
> +when the script should be executed it should be installed in a different
> +directory on the target:
> +
> +- /etc/xenguest/init.pre  : Executed first, prior to guest creation
> +
> +- /etc/xenguest/init.d    : Executed after guest creation, but before it is started
> +
> +- /etc/xenguest/init.post : Executed after starting the guest
> +
> +Inside the directory, scripts will be executed in alphabetical order.
> +
> +Since these scripts are sourced by xenguest-manager they can acccess functions
> +and variables from the parent file's scope, including:
> +
> +- ${guestname} : The name of the guest being created
> +
> +- ${guestdir}  : The path to the guest directory
> +
> +- ${LOGFILE}   : The file to append any logging to, e.g.
> +                     echo "Hello, World" >> ${LOGFILE}
> +
> +Sourcing also allows the script to access params.cfg.
> +
> +
> +An example of how to create the directory and install an init shell script can
> +be found in:
> +  recipes-extended/xenguest/xenguest-network.bb
> +Where network-bridge.sh is installed from network-bridge.sh.in
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> index 752f498..42ccb70 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/network-bridge.sh.in
> @@ -1,14 +1,13 @@
>  #!/bin/sh
>  # This script is setting up a virtual network interface connected to the
>  # xenguest-network-bridge if NETWORK_BRIDGE is set to 1 in the guest params
> -
> -guestname="${1}"
> +#
> +# Since this script is sourced by xenguest-manager, it can access variables
> +# such as ${guestname} from the parent file's scope, as well as those in
> +# params.cfg, for example XENGUEST_NETWORK_TYPE
>  
>  BRIDGE_NAME="###BRIDGE_NAME###"
>  
> -# get guest parameters
> -. ./params.cfg
> -
>  case "${XENGUEST_NETWORK_TYPE:-}" in
>      nat)
>          # Create the symlinks for the files that vif-nat script expects
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index d55c9ff..4d59845 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -475,6 +475,9 @@ function xenguest_guest_start()
>  
>      # Build init script lists (ignore non existing dirs errors,
>      # sort alphabetically and run global scripts first)
> +    #
> +    # These scripts are sourced throughout the start operation if they
> +    # are executable
>      init_pre="$(find ${XENGUEST_CONF_BASE}/init.pre -type f 2> /dev/null | \
>              sort) $(find ${guestdir}/init.pre -type f 2> /dev/null | sort)"
>      init_d="$(find ${XENGUEST_CONF_BASE}/init.d -type f 2> /dev/null | \
> @@ -484,13 +487,18 @@ function xenguest_guest_start()
>  
>      # call pre init scripts
>      for f in ${init_pre}; do
> -        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
> -        $f ${guestname} >> ${LOGFILE} 2>&1
> -        if [ $? -ne 0 ]; then
> -            rm -f ${guestname}.cfg
> -            popd > /dev/null 2>&1
> -            echo "${PREF} Error during pre init script of ${guestname}"
> -            exit 1
> +        if [ -x "$f" ]; then
> +            echo "( . $f )" >> ${LOGFILE} 2>&1
> +            ( . $f ) >> ${LOGFILE} 2>&1
> +            if [ $? -ne 0 ]; then
> +                rm -f ${guestname}.cfg
> +                popd > /dev/null 2>&1
> +                echo "Error in init script $f" >> ${LOGFILE} 2>&1
> +                echo "${PREF} Error during pre init script of ${guestname}"
> +                exit 1
> +            fi
> +        else
> +            echo "$f is not executable. Skipping." >> ${LOGFILE}
>          fi
>      done
>  
> @@ -506,15 +514,20 @@ function xenguest_guest_start()
>  
>      # call init scripts
>      for f in ${init_d}; do
> -        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
> -        $f ${guestname} >> ${LOGFILE} 2>&1
> -        if [ $? -ne 0 ]; then
> -            rm -f ${guestname}.cfg
> -            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> -            xl destroy ${guestname} >> ${LOGFILE} 2>&1
> -            popd > /dev/null 2>&1
> -            echo "${PREF} Error during init script of ${guestname}"
> -            exit 1
> +        if [ -x "$f" ]; then
> +            echo "( . $f )" >> ${LOGFILE} 2>&1
> +            ( . $f ) >> ${LOGFILE} 2>&1
> +            if [ $? -ne 0 ]; then
> +                rm -f ${guestname}.cfg
> +                echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> +                xl destroy ${guestname} >> ${LOGFILE} 2>&1
> +                popd > /dev/null 2>&1
> +                echo "Error in init script $f" >> ${LOGFILE} 2>&1
> +                echo "${PREF} Error during init script of ${guestname}"
> +                exit 1
> +            fi
> +        else
> +            echo "$f is not executable. Skipping." >> ${LOGFILE}
>          fi
>      done
>  
> @@ -530,15 +543,20 @@ function xenguest_guest_start()
>  
>      # call post init scripts
>      for f in ${init_post}; do
> -        echo "$f ${guestname}" >> ${LOGFILE} 2>&1
> -        $f ${guestname} >> ${LOGFILE} 2>&1
> -        if [ $? -ne 0 ]; then
> -            rm -f ${guestname}.cfg
> -            echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> -            xl destroy ${guestname} >> ${LOGFILE} 2>&1
> -            popd > /dev/null 2>&1
> -            echo "${PREF} Error during post init script of ${guestname}"
> -            exit 1
> +        if [ -x "$f" ]; then
> +            echo "( . $f )" >> ${LOGFILE} 2>&1
> +            ( . $f ) >> ${LOGFILE} 2>&1
> +            if [ $? -ne 0 ]; then
> +                rm -f ${guestname}.cfg
> +                echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
> +                xl destroy ${guestname} >> ${LOGFILE} 2>&1
> +                popd > /dev/null 2>&1
> +                echo "Error in init script $f" >> ${LOGFILE} 2>&1
> +                echo "${PREF} Error during post init script of ${guestname}"
> +                exit 1
> +            fi
> +        else
> +            echo "$f is not executable. Skipping." >> ${LOGFILE}
>          fi
>      done
>  
> -- 
> 2.7.4
> 

> 
> 
> 

