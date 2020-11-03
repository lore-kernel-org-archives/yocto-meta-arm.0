Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.4480.1604369337689436499
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 18:08:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=sCP8jYat;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.194, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f194.google.com with SMTP id g17so2217732qts.5
        for <meta-arm@lists.yoctoproject.org>; Mon, 02 Nov 2020 18:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iP4HZL+SSzqrDeUL8QZIUiE/xX9kaRpoT8OffKm8W/s=;
        b=sCP8jYatK9zUxrp0I04yxNuwlQoiXraClGB+Rzp3yfLvqPgj/qBWGDYPYYsmrUBldX
         09OjHq+ztwZYCf9CKoKBmHYvOwpcJCnXNk9Ynx20j/1QPQVUf8HORVA3k+h7IPQG0qcl
         EHWpn1qbrW23ujoSczMSuKBAQgh4DvWHIlOYTMjaV6IP7cDvMoJemqeskC2cxkUCxBYT
         Ak4plLlfePE5gmDw9Ki5vjJyzNF7R4wEhw/W0fA1Msy3Mb78BqYT1k7Unf9Z1mq83SAj
         eTNtqJ2mQi/gRuXEM5F0YmLVfYCpL0xQwReg90+hPmaom8mJcGOHD1P7XJ6as7SfDua9
         lo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=iP4HZL+SSzqrDeUL8QZIUiE/xX9kaRpoT8OffKm8W/s=;
        b=dwkXAXnARSG9ikhvh2dd9qVsyAlKn6Jv+buVF84yQkZ1bkQO+L//ihvLB8ferNzNf6
         YKzYk24IUqBuS0Rw0fXPWmN6xxsZ7/9hMrMwwAVdcrgYz04nyQ8OA52YUClQTWrGnzva
         Gaxb04tepcNnKOd+ooMpjJ64B5xGP1MyxudzlvyeevHQyt4KZVwpM8tXBysBrCU8ivWZ
         iDMF6UU9muvr7AMppZ7+vrd7kH1KZHiPYDDIeLWH8DIyEZPH+GWMKou5hgcL1IZcNS/L
         NOAU7nUjdhtZeOV+a0mAOpq4Z2IhWOpLjr2KNp5tcW0aQrbYyK63wXVSrGHl+TSCF7b8
         BdGQ==
X-Gm-Message-State: AOAM530Uh4WbtWcZ1kRM1c5S///9p8NsrLlHFWmGqQ0wHt3vWFU6EcBs
	Yt3k9lm8qugL8m2DaG7SyIAdqw==
X-Google-Smtp-Source: ABdhPJzdZ05au7pm0bQdWWr/AqLCmUfInbxQOO151tu2owb6RcKQny5OQV3weJBVEj/MqJ3pCSN53A==
X-Received: by 2002:ac8:604d:: with SMTP id k13mr16847307qtm.74.1604369336814;
        Mon, 02 Nov 2020 18:08:56 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id j17sm7320431qke.49.2020.11.02.18.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 18:08:56 -0800 (PST)
Date: Mon, 2 Nov 2020 21:08:24 -0500
From: "Jon Mason" <jdmason@kudzu.us>
To: Diego Sueiro <diego.sueiro@arm.com>
Cc: meta-arm@lists.yoctoproject.org, nd@arm.com,
	Nathan Dunne <Nathan.Dunne@arm.com>
Subject: Re: [meta-arm] [PATCH] arm-autonomy/xenguest-manager: Allow guests with substring names
Message-ID: <20201103020823.GA24538@kudzu.us>
References: <20201030100338.2159-1-diego.sueiro@arm.com>
MIME-Version: 1.0
In-Reply-To: <20201030100338.2159-1-diego.sueiro@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 30, 2020 at 10:03:38AM +0000, Diego Sueiro wrote:
> From: Nathan Dunne <Nathan.Dunne@arm.com>
> 
> Created new function for determining guest running state such that
> two guests with names such as "myguest" and "myguest2" report
> correctly, by searching for exact guestname instead of contains.
> 
> Also modified the status command to use the same function to avoid
> duplication, and added a new nested function for testing status for
> a particular guest, instead of recursively calling the whole bash
> script.
> 
> Using the nested function speeds up "xenguest-manager status" from
> ~7.5s to ~1.5s my machine.
> 
> Change-Id: Ie6fc08cacc55f623c44b08478f76031510a59126
> Issue-Id: SCM-1517
> Signed-off-by: Nathan Dunne <Nathan.Dunne@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  .../xenguest/files/xenguest-manager           | 39 ++++++++++++-------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> index 78ac55d..4ea3a37 100755
> --- a/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> +++ b/meta-arm-autonomy/recipes-extended/xenguest/files/xenguest-manager
> @@ -597,11 +597,22 @@ function check_guest_exist()
>      fi
>  }
>  
> +function xl_list_contains()
> +{
> +    guestname="${1}"
> +    # Select first column of xl list, and find guestname exactly using regex
> +    running=$(xl list | awk 'NR > 1 {print $1}' | grep "^${guestname}$" || echo)
> +    if [ "${running}" = "${guestname}" ]; then
> +        return 0
> +    fi
> +
> +    return 1
> +}
> +
>  function check_guest_running()
>  {
>      guestname="${1}"
> -    running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" || echo)
> -    if [ ! "${running}" = "${guestname}" ]; then
> +    if ! xl_list_contains $guestname; then
>          echo "${PREF} Guest ${guestname} is not running"
>          exit 1
>      fi
> @@ -610,8 +621,7 @@ function check_guest_running()
>  function check_guest_not_running()
>  {
>      guestname="${1}"
> -    running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" || echo)
> -    if [ "${running}" = "${guestname}" ]; then
> +    if xl_list_contains $guestname; then
>          echo "${PREF} Guest ${guestname} is running"
>          exit 1
>      fi
> @@ -668,10 +678,8 @@ case ${cmd} in
>          guestname="${arg1:-}"
>          check_guest_arg ${cmd} ${guestname}
>          check_guest_exist ${guestname}
> -        # We need to stop the guest first
> -        running=$(xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" \
> -            || echo)
> -        if [ "${running}" = "${guestname}" ]; then
> +        # We need to stop the guest first if it is running
> +        if xl_list_contains $guestname; then
>              echo "xl destroy ${guestname}" >> ${LOGFILE} 2>&1
>              xl destroy ${guestname} >> ${LOGFILE} 2>&1
>              if [ $? -ne 0 ]; then
> @@ -719,20 +727,25 @@ case ${cmd} in
>          fi
>          ;;
>      status)
> -        guestname="${arg1}"
> -        if [ -n "${guestname}" ]; then
> +
> +        single_status() (
> +            guestname="${1}"
>              check_guest_exist ${guestname}
> -            if xl list | awk 'NR > 1 {print $1}' | grep "${guestname}" > \
> -                /dev/null 2>&1; then
> +            if xl_list_contains $guestname; then
>                  echo "${guestname}: Running"
>              else
>                  echo "${guestname}: Stopped"
>              fi
> +        )
> +
> +        guestname="${arg1}"
> +        if [ -n "${guestname}" ]; then
> +            single_status ${guestname}
>          else
>              guestlist=$($this list)
>              if [ -n "${guestlist}" ]; then
>                  for f in ${guestlist}; do
> -                    $this status $f
> +                    single_status $f
>                  done
>              fi
>          fi
> -- 
> 2.17.1
> 

> 
> 
> 

