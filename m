Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.5861.1594299321361558490
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Jul 2020 05:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=l5IYoFDS;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.66, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f66.google.com with SMTP id a14so858551qvq.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Jul 2020 05:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VJatwzDo3w70TLocqWnIPBspj5hrzZ8nwT2DnQMtGRg=;
        b=l5IYoFDStccab/mXWxAikqUiQ8YtOiIqPzKj44nyMceJuln9mv1m0n1YjQKaOZ9qhi
         XxQvOipdGlRJ4dpomVyDom8f9J6YSQ6WkOPvnFSjXAy2VdILJ9Y0H7t0azJY0lrHZO0U
         +fscC5bRMTOBQrWUqDSArHnYomR3LkTqFbxSC5OeMJy9PDuXxN9/jvQ8plRac9W9K/Vw
         x2DLWoeasFaOTwv3n2TLTTpFG96wHOMVYDmqib1S97tm43XOgG9ZIjKF+IQNXSR4MKYf
         qv24+98wQsaLqiPiypGFk+3RUFOwAiXXbh28jN+usboroGhZl+Z1WUvme6MDatrxiZaJ
         qaiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VJatwzDo3w70TLocqWnIPBspj5hrzZ8nwT2DnQMtGRg=;
        b=hzG298rbDV64jCx1zqmBBO5SVamJHL7m9ny4ujWzD/mB4QkdbYv08nVogOEvDS6QB5
         LKUOrndW3iXBjWdEtUTfvhrqjzc76OocK97DnrAUGzA7JtRjAqZg3UPh+9poANf3WRhx
         Qu863OpZRNyhgF6JhAxJZh+VdWVgzETMf5KCY1FW+3PoGB4BBRMoSgD6Kn2KBP2jAew9
         QD05iU2NwaqkXXv8CecY1DB0f8C1QhZPX9kAkO5V0TQzNHjYNZfakZgXPwZFr/+NDOgA
         NI1Yhq4wbhl/kAFcdm0jmTe+80FpU8fLX4MN6WZt73cALV51wjYkPS99SbW0T08NwCDm
         vviQ==
X-Gm-Message-State: AOAM530OhX/nJnpMDTIq7gsIFDVQNTlV9Nv1AUhNgw6spvcndIqrm/D0
	SDOjDKExKY73tEZtUVLDOdgz8Q62lSIETQ==
X-Google-Smtp-Source: ABdhPJyAGK6Vn3xf2+wof+euT9zRgebf5ke6ROnljEIu2NyCLM5ZQ/Lx6PWt6FDAqedyx3iwAnkcwg==
X-Received: by 2002:a0c:f802:: with SMTP id r2mr61026823qvn.197.1594299320530;
        Thu, 09 Jul 2020 05:55:20 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a61a:4700:5416:c1ad:e833:f407])
        by smtp.gmail.com with ESMTPSA id x29sm3846641qtx.74.2020.07.09.05.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 05:55:20 -0700 (PDT)
Date: Thu, 9 Jul 2020 08:55:18 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: Khasim Mohammed <khasim.mohammed@arm.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [meta-arm] [PATCH] arm-bsp/grub: Add grub-efi support for N1SDP
Message-ID: <20200709125518.GD9023@kudzu.us>
References: <20200701152349.16478-1-khasim.mohammed@arm.com>
MIME-Version: 1.0
In-Reply-To: <20200701152349.16478-1-khasim.mohammed@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2020 at 08:53:49PM +0530, Khasim Mohammed wrote:
> grub-mkimage is used make a bootable image of GRUB,
> grub-efi dependency in added to conf file.
> 
> Change-Id: Iaf08ed8b5e221003f10fceef9edffbe22b752534
> Issue-Id: PLATFORMS-3134
> Signed-off-by: Khasim Syed Mohammed <khasim.mohammed@arm.com>

Applied to master.

Thanks,
Jon

> ---
>  meta-arm-bsp/conf/machine/n1sdp.conf | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta-arm-bsp/conf/machine/n1sdp.conf b/meta-arm-bsp/conf/machine/n1sdp.conf
> index 755bb09..92adb42 100644
> --- a/meta-arm-bsp/conf/machine/n1sdp.conf
> +++ b/meta-arm-bsp/conf/machine/n1sdp.conf
> @@ -31,3 +31,6 @@ EXTRA_IMAGEDEPENDS += "virtual/control-processor-firmware"
>  
>  #UEFI EDK2 firmware
>  EXTRA_IMAGEDEPENDS += "virtual/uefi-firmware"
> +
> +#grub-efi
> +EFI_PROVIDER ?= "grub-efi"
> -- 
> 2.17.1
> 

> 

