Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C03FA3740
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 22:07:30 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.676.1666390041346203111
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 15:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=MscAM3V7;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id s3so2523752qtn.12
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 15:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83NArZ3Ok3M6EMlx+px1im1iceX/3ndS4VvgVF4eWjc=;
        b=MscAM3V7Rfx4bMOreRRdibmmAw0TIMqXv1NI2oDPCivS6AK+3lc+TE+j/O9WAxzGeO
         7Dri+hDNVfB//y8eqKCd+IX21RSmAWdGcbiluC8l1OiCagp0e7K1vxuhyZ6eeen4sVC6
         0FWVHG/Zcn5mSAo98r85fF1TMrl6ZGyVJO54AJz2y+N/T4DKeQ5ETIbTFPaqJMDULytA
         xKhpTHNvYXpOv+5+Rmvs3voWayGfXepIwZQDM7h9gZT8Fmzr0MVfIhR5chPMZwnWt1s2
         b47jmEjg4dVMiMEp9ndxnxazm4nFqupnIh/kOdb2mTQONlsa1ykdzZKQsNqtnitNiJn+
         vjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83NArZ3Ok3M6EMlx+px1im1iceX/3ndS4VvgVF4eWjc=;
        b=350UENxxwpn8MkkVFj0np+9ysNNL5JCFnkt/fLQFJaiRbCB5Qt6j6mAMutc/+7/H76
         7jv1qOELALP9OpRkNDloqLTyPIsYyMPOoWM7oz/jXfzjm5qcxS2vbQ0WI/Ee89aw0EBt
         5jAesh02D9aWFQfTQxvXMOmxX3xhwYOwqreeaxuU0wpfBDxiy5WG+PouUw02cyfQBq6H
         cZiVKF/8+YCqIObJdZWl3VetbC332H60t6oV1lhNcxJllVg/p3SkSOdgYTQUssVctfMv
         B+2R8FFrkfUCYrWhCkFkEX56VZTNZsEki8XQG3mwHE2Dq7klZ73JQUNrHdbr+6ikG2RX
         kjbQ==
X-Gm-Message-State: ACrzQf3N+xmpc/GVk/FiadH61osfyoQwZyWuBrQQwhO/EaimC6F+MXLx
	OBHGh31fcOiwvkED10ttSbiBOyPlOHivhg==
X-Google-Smtp-Source: AMsMyM5ml0N+W/EeZnkZdyL+M8eQRRX8xU5zLWekUjz3ulBKi8Y/cP78XSdEF6pOeCJyPISIcsmAPQ==
X-Received: by 2002:a05:622a:1183:b0:39c:606d:1f7f with SMTP id m3-20020a05622a118300b0039c606d1f7fmr18345170qtk.313.1666390039988;
        Fri, 21 Oct 2022 15:07:19 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id do35-20020a05620a2b2300b006b95b0a714esm3475718qkb.17.2022.10.21.15.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 15:07:19 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/u-boot: corstone1000: support 32bit ffa direct
Date: Fri, 21 Oct 2022 16:01:42 -0400
Message-Id: <166638250645.2629587.12827043223719117180.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221020164154.3334033-1-mohamed.omarasaker@arm.com>
References: <20221020164154.3334033-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 22:07:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4008

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

