Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.10616.1607708104371159521
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Dec 2020 09:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=H5rxTMlA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id 7so7025750qtp.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 11 Dec 2020 09:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eZJiQhQoYNKOUewDaVF7Js+p+9+SZcsNtL8m/yh630g=;
        b=H5rxTMlAjpbtuldNN4aIpwA2p9JtfoGOctbYUyPBbecKjcZmQuNk70b8urcIb5ZljT
         I5AWqad00Z5k73Ah1L1y+AN/PCnE9jAdrj39K5yh5a+bzLvlQ1ekKEd/3ttlPAGXqJEq
         csFzW13+n2gc/wM3t6qAVYRKc1THMA2oAHSL3y3BJzQVDksj1cmz1Lag/oCh78hKQSl1
         PBtwdrF6OuFwdcD76L3gRwsCgLlVz4umQR/zX00eAyxVXGA04BLw48IxwMknxCrJT8Ao
         yWwqPbO1uw8NGdUYGXDcO57aryEI7hKmktPhgQFiQZKeuUs+/RRLC+M/BOZxqeyN5oak
         ApSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eZJiQhQoYNKOUewDaVF7Js+p+9+SZcsNtL8m/yh630g=;
        b=I54JV+lVaoLsQWdyUHN0UCf05N3jRHXH8pWJKR0gtRSSxGPFrVM2H4xLBzS9vLGNlA
         Z8Bbspe+cyQcFYWSKSRRyzUUcLRDt45MTfhM6T/Tbidv/BnKvBehxhaaU6jFwo6sopZl
         EuHyTKMnlHEx6+82i7DkvUKbJsj+KNsllgJP/9WJik/odkLmrdG+dSydAsGhTYAvYvU5
         BaUUFX70A4tMnAiZfUoSMtJTnS5jsS1cT1aUVTIB+oR4NF+Zjkt/gIsal43UouyA4Tf9
         S9f48J3+L8ZXicYDyp17v8/cVOprIda0LpftbVMHRlZT34081M08zNbX/mVo3gxl3V0e
         PGxQ==
X-Gm-Message-State: AOAM532PnTtBfPU07chAPI2A3UltBAB5nH95Ddy+MDYkkwqzowLchL6V
	hmHu6J5JR/bv0xpYwG4C9FKamg==
X-Google-Smtp-Source: ABdhPJynyuprJjKR9yfVL2nnqaD6/sMfo8mmSn/wnXxjdaCAiaw8TX9PKcsvo2UBTSZa2ECvfaV1OQ==
X-Received: by 2002:ac8:58d2:: with SMTP id u18mr16177163qta.235.1607708103530;
        Fri, 11 Dec 2020 09:35:03 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a606:1b00:c15a:fc65:abe1:c5b4])
        by smtp.gmail.com with ESMTPSA id x185sm6998727qkb.87.2020.12.11.09.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 09:35:03 -0800 (PST)
Date: Fri, 11 Dec 2020 12:35:01 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Kamil Dziezyk <kamil.dziezyk@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-manager: remove double arguments checking
Message-ID: <20201211173501.GB21671@kudzu.us>
References: <20201211110629.25106-1-kamil.dziezyk@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201211110629.25106-1-kamil.dziezyk@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 11, 2020 at 12:06:29PM +0100, Kamil Dziezyk wrote:
> This patch brings following changes to xenguest_volume_init() function:
>  (*) removes doubled arguments validation,
>  (*) adds missing check_private() call,
>  (*) inherits diskdevice and volumename values,
>      as first and second function arguments.
> 
> Issue-Id: SCM-1520
> Change-Id: Id01a326c2db5db1fcaae9237f887e97ea208d6ff
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>

Applied to master

Thanks,
Jon

> ---
>  .../xenguest/files/xenguest-manager           | 28 +++++++++++--------
>  1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index fafe4a0..9acbca0 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -113,28 +113,32 @@ check_size() {
>  
>  function xenguest_volume_init()
>  {
> -    # Return:
> +    # Inputs:
> +    # $1 - diskdevice
> +    # $2 - volumename
> +    #
> +    # Outputs:
>      # 0 - success
>      # 1 - failure
> +
> +    check_private
> +
>      local diskdevice
>      local volumename
>  
> -    if [ -z "${DISK_DEVICE}" ]; then
> -        # By default guest is using disk defined inside xenguest-manager.conf
> -        diskdevice="${XENGUEST_VOLUME_DEVICE}"
> -        volumename="${XENGUEST_VOLUME_NAME}"
> -    else
> -        # If guest configuration contains custom disk setting,
> -        # overwrite default one
> -        diskdevice="${DISK_DEVICE}"
> -        volumename="vg-xen-$(basename ${diskdevice})"
> -    fi
> +    diskdevice="${1}"
> +    volumename="${2}"
>  
>      if [ -z "${diskdevice}" -o ! -b "${diskdevice}" ]; then
>          echo "${PREF} Invalid volume device in configuration: ${diskdevice}"
>          return 1
>      fi
>  
> +    if [ -z "${volumename}" ]; then
> +        echo "${PREF} Invalid volume name in configuration: ${volumename}"
> +        return 1
> +    fi
> +
>      pvs "${diskdevice}" > /dev/null 2>&1
>      if [ $? -ne 0 ]; then
>          # Check if there is no filesystem in the block device
> @@ -229,7 +233,7 @@ function xenguest_disk_init()
>      echo "${PREF} Create ${guestname} disk."
>  
>      # Init our volume
> -    xenguest_volume_init ${guestname}
> +    xenguest_volume_init "${diskdevice}" "${volumename}"
>      if [ $? -ne 0 ]; then
>          return 1
>      fi
> -- 
> 2.17.1
> 

> 
> 
> 

