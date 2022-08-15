Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4065FC3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 01:35:28 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.11714.1660527314432671311
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=pzaIYJ1Q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id h21so4647377qta.3
        for <meta-arm@lists.yoctoproject.org>;
 Sun, 14 Aug 2022 18:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=CtkcVWQmaBpE3ClPuQkcoo+5pCA37WGqbXMdcvDk5F0=;
        b=pzaIYJ1Qmbux9P6jIKFulsFAzMJ2k9bdVFkjj829LItX9FU//EOEUuBvxN0I9c3QYR
         0UPk8zzuhpbWo62jeI0fn2itqEbJHu5ux/Va3XDf0lBt//wuFDVHFcFTyQpKikSmPWbB
         37xdkrgPIThJuKF1MAhT+X8rrYwnrQHrRR1EPS7LucXHIvTNod6NC9RRoYwbcqIKc8F2
         waAfkOJEf3iEftIswWZD4OrNajrJfyNmoEYcZi1AO6115BctvXjUGA4V3jtTVFucWoAz
         zIlLvC6CeuYCnzGUAt8irhsIpCDH/LYjRpzsBjDmF4bHEwg02kJ8pAPDOT+Dc76O5vxG
         WrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=CtkcVWQmaBpE3ClPuQkcoo+5pCA37WGqbXMdcvDk5F0=;
        b=cSCWTedwuUozKz/x6hnW3IMRsuK4QOLOJ2jyhnF52BlrYWKvW4Ih7bK6e4fe3G1tKv
         jMwCkBTqsc44S73sPKiKYE1t7pnAjd7G4DQpMa/vOjhxHb8iVorfmWJ0lY4tjYy6mr+M
         vgo4I8GIAPjsIzpIEojxA4GDgv68ceIZXpx7c9IPmLfAe/1hNhTS2JWmlf6WwgNNDiaG
         MpCuZHZ+2/n6Gh/Ve6Pol6LjijtqgDFU4K3shFU80uuVMgzip+O/FjkFjfL/by0F8A6Z
         wB64IJ8LiSZ8EeFNlNfzX+Ouvs1oxaHxiPz/sZmguAxs8z703HVZ/SKjwAV9jGRLuj8e
         iRGg==
X-Gm-Message-State: ACgBeo3fSD+WQH9UljtK4AJz2S6DmhTvh//AzXsTesmoIC3psAajcZCq
	p+0qCE7Wc8O3Ge29h+Hgz2w8HxKq1P9lMAZg
X-Google-Smtp-Source: 
 AA6agR7U+RomdhFLN65lHxNjXKPip+yHqHk5c7s4BgU187fRmYidreW2R392XsABC7xZzv32Sv02tw==
X-Received: by 2002:a05:622a:1a05:b0:343:87eb:c686 with SMTP id
 f5-20020a05622a1a0500b0034387ebc686mr8385964qtb.643.1660527322221;
        Sun, 14 Aug 2022 18:35:22 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bb12-20020a05622a1b0c00b0031ef67386a5sm6795042qtb.68.2022.08.14.18.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 18:35:21 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/juno: drop scmi patch
Date: Sun, 14 Aug 2022 21:35:15 -0400
Message-Id: <166052731728.2952774.9908122400828629565.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811140503.10500-1-jon.mason@arm.com>
References: <20220811140503.10500-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 01:35:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3681

On Thu, 11 Aug 2022 10:05:02 -0400, Jon Mason wrote:
> SCMI support was added to the latest kernel (kernel commit
> 96bb0954860a4c8b8c77d59fc53cd4cafac914f5).  So, remove this patch, as it
> is no longer necessary

Applied, thanks!

[1/2] arm-bsp/juno: drop scmi patch
      commit: 038ca93bed26983569ddb59b200dc5585849822f
[2/2] arm/qemuarm-secureboot: remove vmalloc from QB_KERNEL_CMDLINE_APPEND
      commit: 257c69f11fb534384a4e1f34898095fb6cac285c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

