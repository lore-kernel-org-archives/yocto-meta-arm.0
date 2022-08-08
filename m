Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBF1C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 19:33:12 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.2912.1659987185423968444
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4GTFpuHu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id j17so2475107qtp.12
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 08 Aug 2022 12:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=CpBXhou2DQGtN8Cv+tZeSNbFzqYcyv4/nFK6nafE7XA=;
        b=4GTFpuHuMCkR+VLFG5+o/giWzDQpOmz+pm7GTpY+lMO5X37YynWOw5zD6LMr6FzuxP
         lnuwSaTtkqkHss2FTEGr2VngADRL7jovFGG1e08XD5vLuwVSeAfdOB8i98eobCDFOcjf
         RXTCKczc7eqnkfnHmOae6XIxqFh2k5Lyq0PRh+Mc6nxZeWOnoo2M6CfUiVY6ZMwxilfn
         iqU3vtNt7uy7cusWTChdDxy9H72zMDoVCrJl7pxjp5I63UnadvdM/bWb2NgeRL9C+6Vu
         UYewiBk5kXjSVZX461AhHNCatGpesuy0xr8N1dxFS/XNDfDWKjquaLEsPLOUMXKMEajD
         /JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=CpBXhou2DQGtN8Cv+tZeSNbFzqYcyv4/nFK6nafE7XA=;
        b=YTRDOwCKijmdE0AH1GL4A3cG3I2G6FY3WNRFu7k+kQNyp30GSiuuuKXM1xto0h302R
         2VN9YhOBSoPFLR7BIEs8OuatphSc+Yuw38DHh5RH5YqDma4+GCjkzRPmYJinRs+UAt17
         Cfq1RVZjYcNIryay65g25cVyDMOxoFcp85pQHtuatwR2BtMBf+Z9RLJmVWDaTrza6nXy
         1NwLnPBMGXt81BC9HuoGeNU0dYD7R57JQapV7lnZxn9lkhdCbVb7NPzsAFg8SHVA49g8
         SZGpC3zrGtlM678Mf19OlZFaWg9o3BxJ5iJ2sFXVFhT7gOu6mPHWj9UyCZM6tYTfA1u2
         kVXQ==
X-Gm-Message-State: ACgBeo3PHwkJKrDiNyCjGuDSygI04bKCA6t3dASbqlb64113YncMUnZr
	F0qu5bfz8O8D24+T4PfPR8Ufvc9CvPM3/Q==
X-Google-Smtp-Source: 
 AA6agR6RdqtApGGL6LvxlfTKhZrEK3BP6uflqqW9cp2A/HRsBFbQIf459yIQJR4yV0Jtj0x1xo+lpA==
X-Received: by 2002:ac8:5cd4:0:b0:31f:1cee:f3d2 with SMTP id
 s20-20020ac85cd4000000b0031f1ceef3d2mr17561393qta.549.1659987183980;
        Mon, 08 Aug 2022 12:33:03 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 j9-20020a05620a288900b006b5d8eb2414sm9657548qkp.120.2022.08.08.12.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 12:33:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"changqing.li@windriver.com" <changqing.li@windriver.com>
Subject: Re: [master][kirkstone][meta-arm][PATCH] optee-os.inc: support
 multilib
Date: Mon,  8 Aug 2022 15:32:10 -0400
Message-Id: <165998712992.2694645.16318867946383450085.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220802062819.4061434-1-changqing.li@windriver.com>
References: <20220802062819.4061434-1-changqing.li@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 08 Aug 2022 19:33:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3657

On Tue, 2 Aug 2022 14:28:19 +0800, changqing.li@windriver.com wrote:
> Run command: bitbake optee-os && bitbake lib32-optee-os
> bitbake lib32-optee-os will fail with following error since
> bitbake optee-os already deploy same file under the path.
> RROR: lib32-optee-os-3.12.0+gitAUTOINC+3d47a131bc-r0 do_deploy: The recipe lib32-optee-os is trying to install files into a shared area when those files already exist. Those files and their manifest location are:
>   /build/tmp-glibc/deploy/images/qemuarm64/optee/tee.elf
>     (matched in manifest-qemuarm64-optee-os.deploy)
> 
> [...]

Applied, thanks!

[1/1] optee-os.inc: support multilib
      commit: 844696e401bca5df7a06092c059d03ea71df9990

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

