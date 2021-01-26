Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web09.18347.1611691133230485105
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jan 2021 11:58:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=13x67+o8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.42, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f42.google.com with SMTP id l14so6404737qvp.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 26 Jan 2021 11:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dtdRSmIIWrPVMgUA9ts63dySsLJay9vwWdMVq7COa58=;
        b=13x67+o8u1NgO/g8rh78rXeCwrP5+6713favdpoAndcJ82Sy0bJE/vg42RpXjE3J95
         i4iIU+hVpeXMHRU3+MFxE5niPDo8FTycxPbs3RNwv9pOhrE267wNQq3+yz8Or53jBPHD
         zsp1Ruy9MoaErVK/Id7TIh6TdqtDgrebJhla33m983wONxVC7+pOTn4vJWZ0mKggf6Ds
         Fdq+vxVsQm0RqKHu+e+abpl0VckjjhUNTIXCVoKguHGAGr0HeVc7IAzKNlA88PWsLQK3
         iJRwRV7WXYPRE2BoJg4Id6SJuFEmQYvybE/bGxjTfMLZQnA+Q6jVhRwrPDwW2PZUEd0R
         eO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dtdRSmIIWrPVMgUA9ts63dySsLJay9vwWdMVq7COa58=;
        b=lATlKL7HbiNq7H4BtBHCwcg/JYzjbL/EQRF7A6OtDqi0bQTyCJqsED7Rp2Sdu9LBxB
         y4GdFB8IJjk9lSQSzSzwVcGWhhf7za7zwdk7qhsWr7tFkJJJ7rzc4PRG6y3YqWHZ1bZO
         gRw8pu5le1Ns9Rh0TeRW4QXkxxI+VmF8O7Sz6VDJ9KOLSxsb11TcrMIORowFjgqxq29G
         RyFChEz3kFe9jBxbMGp1MZft03eDWlDbTSJsxQUu1Cffd0fhb5ddGq8z2dFJ3QdT83jO
         ZZZer9NxAEeS2EKyKXYDSqbVu0oIlkOkrIM+HtyGGRgUtZ4K0WCXOnPJD7onKi9S0IPL
         VyIQ==
X-Gm-Message-State: AOAM531OYhdKbPRwX61ubSVcAzDkBdLgolrRatBBpI9Vjt18jw5TCooh
	QdiXLItQh8BtR2x9pw42wJTDqw==
X-Google-Smtp-Source: ABdhPJzyLuGix9W5y0tbxFaBL5cWc+kmOolzmX5IFflotY9zrOq0eulxw/TB0bDuA+olqVzu/QOueA==
X-Received: by 2002:a0c:b990:: with SMTP id v16mr7150636qvf.16.1611691132338;
        Tue, 26 Jan 2021 11:58:52 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a62f:6d00:2831:137d:6845:b616])
        by smtp.gmail.com with ESMTPSA id n7sm14727347qkg.19.2021.01.26.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 11:58:52 -0800 (PST)
Date: Tue, 26 Jan 2021 14:58:50 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Nathan Dunne <Nathan.Dunne@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-manager: Make stop by default a blocking action
Message-ID: <20210126195850.GC7069@kudzu.us>
References: <20210125154123.12308-1-nathan.dunne@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210125154123.12308-1-nathan.dunne@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 25, 2021 at 03:41:23PM +0000, Nathan Dunne wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Added -w parameter to xl shutdown to force it not to return until
> the action is completed, and modified logging to reflect this
> 
> Stop operation can be configured to return immediately using
> --nowait parameter, or to force destroy the guest if the graceful
> shutdown fails using --kill. Both are now documented in usage().
> 
> Issue-Id: SCM-1861
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>
> Change-Id: I664acc8a6a1eb17619fa2fd9b372ea661e537923
> ---

Patch included in master branch

Thanks,
Jon

>  .../xenguest/files/xenguest-init              |  2 +-
>  .../xenguest/files/xenguest-manager           | 36 ++++++++++++++++---
>  2 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> index d580908..c6b0c83 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-init
> @@ -68,7 +68,7 @@ case "$1" in
>          # update guest list
>          guestlist=$(xenguest-manager status | grep Running | cut -d ":" -f1)
>          for f in ${guestlist}; do
> -            xl shutdown -w ${f} || xl destroy ${f}
> +            xenguest-manager shutdown ${f} --kill
>          done
>          ;;
>    reload)
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index be2af32..7e5f868 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -200,6 +200,12 @@ with ACTION being one of:
>  
>   stop|shutdown GUESTNAME
>     Stop guest GUESTNAME (send stop signal and let it shutdown normally)
> +   Pass 'stop|shutdown GUESTNAME --nowait' to return immediately, rather
> +   than waiting for success or failure to return.
> +   Pass 'stop|shutdown GUESTNAME --kill' to force kill the guest if
> +   signalling the graceful shutdown fails for any reason
> +
> +   These two parameters are incompatible, so only one should be passed
>  
>   kill|destroy GUESTNAME
>     Kill guest GUESTNAME (stop directly the guest without signaling it)
> @@ -871,17 +877,36 @@ function xenguest_guest_start()
>  # Private
>  function xenguest_guest_stop()
>  {
> +    local guestname
> +    local extra_arg
> +
>      guestname="${1}"
> +    extra_arg="${2}"
> +
> +    shutdown_args=""
> +
>      log info "Attempting to stop guest '${guestname}'"
>  
> +    if [[ ${extra_arg} != "--nowait" ]]; then
> +        shutdown_args+=" -w"
> +    fi
> +
>      check_private
>  
> -    log_command "xl shutdown ${guestname}"
> +    log_command "xl shutdown ${shutdown_args} ${guestname}"
>      if [ $? -ne 0 ]; then
> -        log fatal "Stopping guest '${guestname}' failed."
> +        if [[ ${extra_arg} == "--kill" ]]; then
> +            log info "Stopping '${guestname}' failed, calling kill..."
> +            xenguest_guest_kill "${guestname}"
> +        else
> +            log fatal "Stopping guest '${guestname}' failed."
> +        fi
> +    fi
> +    if [[ "${extra_arg}" != "--nowait" ]]; then
> +        log info "Guest '${guestname}' stopped successfully"
> +    else
> +        log info "xl shutdown exited successfully for guest '${guestname}'."
>      fi
> -
> -    echo "Guest '${guestname}' may not have stopped yet. Use 'status' to check"
>  }
>  
>  # Private
> @@ -1066,10 +1091,11 @@ case ${cmd} in
>          ;;
>      stop|shutdown)
>          guestname="${arg1:-}"
> +        extra_arg="${arg2:-}"
>          check_guest_arg ${cmd} ${guestname}
>          check_guest_exist ${guestname}
>          check_guest_running ${guestname}
> -        xenguest_guest_stop ${guestname}
> +        xenguest_guest_stop "${guestname}" "${extra_arg}"
>          ;;
>      kill|destroy)
>          guestname="${arg1:-}"
> -- 
> 2.17.1
> 

> 
> 
> 

