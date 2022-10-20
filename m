Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5D42C43217
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:30:37 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.9937.1666359035820837771
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 06:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=IbFKgrRQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id f22so1612346qto.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 06:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83NArZ3Ok3M6EMlx+px1im1iceX/3ndS4VvgVF4eWjc=;
        b=IbFKgrRQLdo+FlzoTRU/FF+KuRKEJ7y3hZ8HXsA4lv3+3UBkJLvYz9w6R4hhbcXURP
         qSJ9SL+bHebhWbuWYx2JLMWYEekfZ3KdzCqfWvCsrlvywZQJ7MEJYVxJNDGzuT2toE0Y
         nEq6NTlDNtmXxApkBnMEyUJDBSpDcpK2kdNFPVLocZ+HCiEExN8rNadaYuQq5kTV0389
         TDWhyUAZBKG8RdT16pPwi0dLg/p89O62ZyN2GWT9415ZhnYgoH31xi28Mq4a7c0Rxocs
         Cd/ZNJNhCQ5j1qOE/JHJExrJefnp0ioUdYc2hmHS1FoH9RO46sqeuCNs3aFtWTmeCi0x
         mvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83NArZ3Ok3M6EMlx+px1im1iceX/3ndS4VvgVF4eWjc=;
        b=2ZfAhOi1dMH942FPBr+C2KRHBL3YV3k38lDFTUzDD1dRLYwMZbm97sqBIVDvC0itJs
         5BWWVILyAnd7E72r54GVbg/u2GVueP2WTWOGzjLAD8YN3CCi8icgnnoIpkBwxPRG6I5J
         I3Yyv6piXqXOsHr0B1RpQYxoZKJcDC2Q3K3WWqgKm+M6yHv3dNHMzzE+StU+p10y2JVh
         qoNQ5TtedVUbfMy5P39skcRd+UMZF/WL8TdpaTxCVSRYeCd4d2tEpEYryjUvVzVjiZbc
         c9BUCfCbr6i+g+NvL66CwVxR8kMfvOcE9vobDEbPlu+9kaWan7RxjwiQG5Bpy7mDJz1T
         Y66g==
X-Gm-Message-State: ACrzQf3gSzFV8Q5Kp12Pw+mCjVsLYpsDsvtWV8SGmF83YDq+LEaWac9h
	hhj+XV1Yn29MNXhvuXocoqC8WNc7IMy1Sg==
X-Google-Smtp-Source: AMsMyM6T2TyzWNQaY0l8bWjIDR+1xzKGp2wEyxJjn3OXZDEbA+oWWUbwhYbnD9zUZvm0QPI2meXv+A==
X-Received: by 2002:a05:622a:242:b0:39c:f8a5:480a with SMTP id c2-20020a05622a024200b0039cf8a5480amr15412500qtx.337.1666359034452;
        Fri, 21 Oct 2022 06:30:34 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id u12-20020a05620a454c00b006ce2c3c48ebsm9777178qkp.77.2022.10.21.06.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:30:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/u-boot: corstone1000: support 32bit ffa direct
Date: Thu, 20 Oct 2022 16:24:53 -0400
Message-Id: <166629749412.441713.7847939421219449765.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221020164154.3334033-1-mohamed.omarasaker@arm.com>
References: <20221020164154.3334033-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 13:30:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3992

On Thu, 20 Oct 2022 17:41:53 +0100, mohamed.omarasaker@arm.com wrote:
> This patch Adds support of 32bit ffa direct messaging mode
> 
> Mohamed Omar Asaker (1):
>   arm-bsp/u-boot: corstone1000: support 32bit ffa direct messaging
> 
>  ...-support-for-32-bit-direct-messaging.patch | 182 ++++++++++++++++++
>  .../recipes-bsp/u-boot/u-boot_%.bbappend      |   3 +-
>  2 files changed, 184 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0031-ffa-add-support-for-32-bit-direct-messaging.patch

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: support 32bit ffa direct messaging
      commit: 14c7e5b336f3d38a30eaa3a1241df03dd3021ccc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

