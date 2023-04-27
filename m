Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3494C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 13:04:22 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.19781.1682600662352024645
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 06:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=HlgFiLEJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3ef3d90f773so40289851cf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Apr 2023 06:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682600661; x=1685192661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttrYOU7uXoG/rif6csn2Jaw9kyjPoW78QtxpiMfhedk=;
        b=HlgFiLEJsuA1pj9NIrFoCiq5MiMlKJsc6ZNrSp8vWFiGqEYoTzAROt1AJXOAYN7UE2
         DbwJs5FsD5c1nuaf4Z7WE4bvMV/ZJmpHqplIRM/uJ7dkwyPWCGuVc3FymOodz/PT6YIu
         zpfQZOcerV1Heu84G2y39CYin/1u2qDGhVYqRlIM118M1DCrH4aIlBZsHK6Vi1TqvIhU
         P3G7o5yrnK07O8XSw3E68Bwph5HKHHwFju9FVmRkKjcSlBzENufbeRnYDHPV2ApjzKNo
         wB1/38SXSyaoPcLgaPowNv+MN0GhwedXghX5GrPbVsoAg26aT7P5m2d6v6bRV5HUW/xm
         wZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682600661; x=1685192661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttrYOU7uXoG/rif6csn2Jaw9kyjPoW78QtxpiMfhedk=;
        b=SLTb78dXlN4rpgisqYbjRGukXm5xgggtNWHWC04BGcIv3cE3txKoGd0AS52CZztBkM
         SEQqjaFtYZKfRkKuIz4rmVnCwNzDErIDSdVTBSXQgn9DI7toHOcNoLqUm5P6II47rS7I
         oJW9bAbULI046HGsCFkOHmaiXlRkBO+kC4dnrIt58FYXXpUhu/05ha60LMg1gJg6T2rJ
         6qhA1IflLLgQJVXywYZ3stAfT2a8jX+QKlxXYHGHhZYVh7Rs4qOnptBkEI9u+jSxhh/5
         JZovebxCeSIcXo9aR371N8aib4M35ZiY834zbkwiPLAYK/KZYi9Ry4h5z1rID4iyYzi7
         RtoQ==
X-Gm-Message-State: AC+VfDyTMrcAjZch/av2jhbV7bfORlcTsqq/GdEN/JH54iIKK0SA/e6O
	Ae6V+RkE543VVAhvG8m4cumcqopoOfeFBPhLpBA=
X-Google-Smtp-Source: ACHHUZ4aO+J5orKrJ2eU/j9uUf2ggAbjswxtldE8mjOysMF6f966GlrCKw/n5XeUn2giavu5kUz7VQ==
X-Received: by 2002:ac8:5cce:0:b0:3f1:f797:19c with SMTP id s14-20020ac85cce000000b003f1f797019cmr2285571qta.63.1682600660867;
        Thu, 27 Apr 2023 06:04:20 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id l10-20020ac8078a000000b003e97fe68511sm6175464qth.3.2023.04.27.06.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 06:04:20 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][langdale] arm-bsp/external-system: fix the gen_module race, again
Date: Thu, 27 Apr 2023 09:02:09 -0400
Message-Id: <168260052963.2533549.15132805960423411667.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230425143804.2568183-1-ross.burton@arm.com>
References: <20230425143804.2568183-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Apr 2023 13:04:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4620

On Tue, 25 Apr 2023 15:38:04 +0100, Ross Burton wrote:
> Apply the patch from scp-firmware to the third copy of the buggy
> Makefiles which fail randomly under parallel builds.

Applied, thanks!

[1/1] arm-bsp/external-system: fix the gen_module race, again
      commit: 7d50f71baa0be1523673e229ac3e3d0306789a90

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

