Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED42EC433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 22:53:34 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.633.1646780013700849030
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 14:53:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=4vg199IC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id a1so448473qta.13
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 14:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gdnTC5GlaJDVW9lUFPMWe//nA+PkMVjxgkA5zao9D+w=;
        b=4vg199ICrLrrFCQUX/NFeRTxd6tN4MdFmUhj3iNequSYOm0YpetTw3AMzyrMEkco+F
         dQvxZAQIxbjagIt6CqcbwouwERbQzTi3qa7GioozPL5WU3BH6U8ET/YmEAqlqyfcj8ul
         14yKwzipLZSsB1HaWd++vOPPm1Lyba6pC66LXojnEjTQ04lXS2CD39H5/eI1ERpicpID
         kuipBra4TrV9HSoHaar5iv/wb2nWBEH7dPBYSJAh2N6QWA1QxMSJZjgXPuWRKh5icgy9
         gqX/o1k1XaFASsL+TbcpwV+edK5DGYMUKAJW1F48X6vom36dSZGWjEXl4zgDxQGeHAbm
         4b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gdnTC5GlaJDVW9lUFPMWe//nA+PkMVjxgkA5zao9D+w=;
        b=jokPrfCKoZAmD89zvcOT0V9ZoXCJpxFzegyg0sBjOE+j5PmVln8vpS1cXsnF1kDdfK
         9gdIxD623fObD16a0UGi6fIl3P6BoW3vo7K196/VPitvhHuCoL74+4yfgjRkjjGjVNcH
         lVeDZ5IFQdifm5o6T1vF8DqLbOS94NzU8nVA7BnUYdajzM5hnjwl1A6ljgBPTzp0O7N/
         X1v3HETjGpgt4vtreDactLq82zGXEXB7hJ3c29A0Js7sx7jnc87Vp335HWHbj6js+hri
         PhnUWp5IpTJIn+QvxYQD8ouyVAebVp5bVjeT/JroN04hEbUqj9/adzyHmy1BHqwcQ11j
         YqUA==
X-Gm-Message-State: AOAM533RRhb5oHoI5ldIzc5g0L2ZcDkQC4nqw1pS5uEyIHcMqmvHVDlE
	BiRCP6G7o1/FofPcl22Mjd/4unoxdJxRACxs
X-Google-Smtp-Source: 
 ABdhPJzkFgswQ0mcwNPraTVcmLEKgOWMaUNit5my0dRQ610LH2LPrh+9SuDP4Yb2T6xtbph2KYD0wQ==
X-Received: by 2002:ac8:5b0f:0:b0:2e0:5a1f:9910 with SMTP id
 m15-20020ac85b0f000000b002e05a1f9910mr14771641qtw.356.1646780012740;
        Tue, 08 Mar 2022 14:53:32 -0800 (PST)
Received: from localhost ([2605:a601:a66c:b900:3ca7:c4b3:8bcc:39e7])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a05620a0c5000b0067af598be2esm136907qki.136.2022.03.08.14.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 14:53:32 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Rui Miguel Silva <rui.silva@linaro.org>,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 0/2] meta-bsp/corstone500: update u-boot and kernel
Date: Tue,  8 Mar 2022 17:53:24 -0500
Message-Id: <164678000475.3748604.14464452558977894636.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220307211931.457610-1-rui.silva@linaro.org>
References: <20220307211931.457610-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Mar 2022 22:53:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3138

On Mon, 7 Mar 2022 21:19:29 +0000, Rui Miguel Silva wrote:
> Update patches and recipes to bump u-boot and kernel version.
> u-boot -> 2022.01
> kernel -> 5.15
> 
> Cheers,
>    Rui
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/corstone500: move to u-boot 2022.01
      commit: 5c83fba36a78c5d8567cea70060d4b57cfed95ab
[2/2] arm-bsp/corstone500: move to linux-yocto 5.15
      commit: b40e705945af56ef36794abadf18106da0c66a89

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

