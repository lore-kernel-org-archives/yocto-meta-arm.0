Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6220EC77B61
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 01:35:15 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.2196.1681436108690662128
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 13 Apr 2023 18:35:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=ovcsrjSc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id cm23so7945578qtb.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 13 Apr 2023 18:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1681436107; x=1684028107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJwQPrLa10lGlbbCbQdcEmAHR/MhlZA09WMA6TDaSyM=;
        b=ovcsrjSclHGk2y/xDR9L29x0m6W5HhDRysoR+3eq2r4gI+01GIODfL30yhNv0qeIGt
         LgOMeCL7p/ySsbvVutxwZdt/fv6ZBA8/GjTvLi8AzKO8d7YQtYjCeLfc/itRvM5Rj+sR
         NjVV450obn+2URFGUjpB+BD+UbFihVZaiQeRue3J6b9mzph21n3JqNmV/V2oKGxOd8Yh
         PdvcTZXwYlvjwgXH/iUfcC6RnhmJjgNGLfrdJwxOoglW4ykLobRS66wz4U1F+ZBaYew8
         pCNs7QO//lEfflg3G5+SwLjkEZz18nh/ggHjLZ89AeJv2JOPUsxi1p8Zbw6lVqIQHr9B
         T/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681436107; x=1684028107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJwQPrLa10lGlbbCbQdcEmAHR/MhlZA09WMA6TDaSyM=;
        b=Han2SQEeZlVGHpFRbhmpQVpiDKhMj//DyQX45eJOQ86eO1mrOMUuVTBpD2UXaDfmS+
         SHEnv5uxoOowYw4duIlV02Ff7wS818FBIUV7oyOSZCdFZZJ+nZ8x8OO5vTGxa4Hh1msP
         BU2W0t9Pj49uln9ltL1RoMT/YXtzCRiHFAC8qk+ui8Dh4iJbkVgE2k16zNP6VYUJEtl1
         bdN9hXIZUbWDQIqVfjEqWw50uuyh95mRCL1eKTTH/jIPqzhqChohXHMJZOhpy3IAenBx
         KaIZFw0u/4jtaVzoVmIVaxxR6ZusD0ev7YxmkL3fWleUp2IeJsTPM07TFIeYgqVsH8WN
         O9jg==
X-Gm-Message-State: AAQBX9e6yftvOmCjqOC+tXBesBgw4nkKPdkg5Y35kQKyWARu5SUu0lmJ
	tncJVwsVlmWFksZ2lZnz/DoU1/iH6MpOXgk3yks=
X-Google-Smtp-Source: AKy350YlKGzxO/N2WxCHEi2Qt/3HOLSWajIHk57HFmK2083AwvSRFS2Isy24VHiD6nnTG2K2KmIEvw==
X-Received: by 2002:ac8:5a05:0:b0:3bf:d1da:114b with SMTP id n5-20020ac85a05000000b003bfd1da114bmr6825717qta.47.1681436107373;
        Thu, 13 Apr 2023 18:35:07 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id e20-20020ac84b54000000b003e37e0a3d89sm900224qts.42.2023.04.13.18.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Apr 2023 18:35:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vikas.katariya@arm.com" <vikas.katariya@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH kirkstone 0/1] Fix N1SDP PCI quirk patch
Date: Thu, 13 Apr 2023 21:35:01 -0400
Message-Id: <168143610038.3580520.3407998153149234332.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413163518.5012-1-vikas.katariya@arm.com>
References: <20230413163518.5012-1-vikas.katariya@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Apr 2023 01:35:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4576

On Thu, 13 Apr 2023 17:35:17 +0100, vikas.katariya@arm.com wrote:
> The poky commit 74f086529911bdaf07a8414d50de411e20739541 updates
> the kernel to v5.15.103 which breaks the PCI quirk patch for the N1SDP.
> 
> Vikas Katariya (1):
>   arm-bsp/linux-yocto: Fix N1SDP PCI quirk patch
> 
>  ...002-n1sdp-pci_quirk-add-acs-override-for-PCI-devices.patch | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks!

[1/1] arm-bsp/linux-yocto: Fix N1SDP PCI quirk patch
      commit: 96aad3b29aa7a5ee4df5cf617a6336e5218fa9bd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

