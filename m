Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B42AC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 12:17:08 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.13660.1714479424786322951
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 05:17:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Z7FDHnbK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6a073f10e25so29496826d6.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714479424; x=1715084224; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcRvnDpk0o9Q1mZV0hSIysMgp0Y77lHs437/MXpBfAI=;
        b=Z7FDHnbKRFBGcDSgwxz5t93tPmYO6XLULzsMynrBYFgN4kt/FJFicOVhjFWKPflxFJ
         wKTjZnvSYBT5m93WBo7wQ/ImwKoX/I7bouRrngy+AvhlRFtBTpLlKKUHr5W50TliWUvS
         FibkJxHVQ320qM54ERzBNRp3PxkX5wvQukb5A5kGZMI/BWVeZnFJ13CG97z45EbRP3/4
         ETK/4QuA6ZOLSmJaqFNGda/d0Rq9lkesbZTXflzQFrMCZ3OOUez22TkMLIkGJnn3Dfji
         YgdL+iShY+BNNxOEtLtmZTQDWojfmTx2Y8QrWfIZoDjtI8VXldwXdEgaYhJ/RGEoGaLs
         GymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714479424; x=1715084224;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcRvnDpk0o9Q1mZV0hSIysMgp0Y77lHs437/MXpBfAI=;
        b=PBrS0qqWFAaVF9lxo6dZ2/NearEdGtSsV70jzOxbAXJDky0X9KTagFbmSATB4+9EIL
         AQcfjJNUIM8yMB96EmK12xHg4EUPapRo9CwQbYNu0NmZJgLnjnhlqOzb/YZwyTDG6b+9
         lrY4dqaY9Cd5FjSXZNLms7304LRv/Mof02W4NrMLFRZZM1wJ2ZY/kQgC8vX7ZATs1cg+
         0xkPsqyrzh4N2ZOLd1e0lm+QnkwsT1NaYo+FeHCQMcOWWsyxXHVkiuPoqLReuOlFJpBx
         FKPeu6lrPIzbt4OyotEwxSbSiQISgyEfNc/iU/Pq7YznfmB83otQKH/LIkKcV5gn9X54
         daxA==
X-Gm-Message-State: AOJu0Yx5QQIMe8QLJK67nqBfuD7c/OCSL9M6xhUSFxYa1WyKeRwevLAt
	wqKmBHmiR/bmh5d4Qvj1eZjQPzBV2MqVBr1UH0rq9mzs/A18YXoz1v4g10AL8A==
X-Google-Smtp-Source: AGHT+IGGsyFbxYbUMBWF7gQcI5Csb5pxvz5JCt6VlGIT39WkOZnpDHfqhO6AFe0XYa3NvdmjDF64yA==
X-Received: by 2002:a05:6214:e89:b0:6a0:c922:a8d5 with SMTP id hf9-20020a0562140e8900b006a0c922a8d5mr7618402qvb.11.1714479423620;
        Tue, 30 Apr 2024 05:17:03 -0700 (PDT)
Received: from kudzu.us ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id mm8-20020a0562145e8800b006a0d22f23c0sm1548425qvb.61.2024.04.30.05.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 05:17:03 -0700 (PDT)
Date: Tue, 30 Apr 2024 08:17:01 -0400
From: Jon Mason <jdmason@kudzu.us>
To: adam.johnston@arm.com
Cc: meta-arm@lists.yoctoproject.org
Subject: Re: [PATCH 1/1] arm-bsp/n1sdp: Use git clone to fetch FW for the
 N1SDP
Message-ID: <ZjDhPYD4Os5X7trN@kudzu.us>
References: <20240430082413.1131081-1-adam.johnston@arm.com>
 <20240430082413.1131081-2-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430082413.1131081-2-adam.johnston@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 12:17:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5640

On Tue, Apr 30, 2024 at 09:24:13AM +0100, adam.johnston@arm.com wrote:
> From: Adam Johnston <adam.johnston@arm.com>
> 
> git.linaro.org/landing-teams/working no longer seems to serve snapshots
> in tar.gz format, breaking the N1SDP build for kirkstone.

In the future, please add "kirkstone" to the subjectline (after PATCH).
This allows my magic scripts to automatically apply and run CI while
I'm sleeping :)

In kirkstone-next now, pending CI passing for kirkstone.

Thanks,
Jon

> 
> Using same tag as the existing snapshot, fetch the binaries with a
> conventional git clone, as per master.
> 
> Signed-off-by: Adam Johnston <adam.johnston@arm.com>
> ---
>  .../recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb  | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> index 228ed927..2295b772 100644
> --- a/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> +++ b/meta-arm-bsp/recipes-bsp/images/n1sdp-board-firmware_2020.07.27.bb
> @@ -11,10 +11,11 @@ INHIBIT_DEFAULT_DEPS = "1"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  COMPATIBLE_MACHINE = "n1sdp"
>  
> -SRC_URI = "https://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.git/snapshot/${BPN}-N1SDP-${PV}.tar.gz"
> -SRC_URI[sha256sum] = "57feba404026f2d6d49c167d63e0e84653ad8b808b13e2244b81fea9e0d58d66"
> +SRC_URI = "git://git.linaro.org/landing-teams/working/arm/n1sdp-board-firmware.git;protocol=https;branch=master"
>  
> -S = "${WORKDIR}/${BPN}-N1SDP-${PV}"
> +SRCREV  = "9a095cbdf8ef59a7433e2769e4e2e92782b68c50"
> +
> +S = "${WORKDIR}/git"
>  
>  INSTALL_DIR = "/n1sdp-board-firmware_source"
>  
> 

