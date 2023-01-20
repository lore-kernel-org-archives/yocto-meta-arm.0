Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F711C38142
	for <webhook@archiver.kernel.org>; Fri, 20 Jan 2023 02:01:35 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.64872.1674180091242505783
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 18:01:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=73d3+RMH;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.179, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-4ffdd9352b6so1523657b3.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Jan 2023 18:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VthEHlZHr23DRmbr9MOlWVRr4kifLhZmHvZpURUh+Qc=;
        b=73d3+RMHXq3ewi7f64XviTqqCX7p1msdjuFK8H7BabAeN0+xutEwao6gunXg1efrCD
         YpUUs+OT31wFbHDvE43koQCPB6KfuWo6oeQUdyO+UKwYI6NJvuJ5axo69D6DU3iFb0fC
         4IdqRFl2YG4fCwolLIXl5tiYl9e91KYsFjf4HsxbKZ72LxBN4eVzFGUT5L3rQZNz7Sac
         5JK8XyGWBzl+84j59Ip8cXdPBQJYFenE4DPzZC4ZzxcMvq/KQOaIHzrrrjwq+hcQf6ry
         X3CYc2uS+IePE7qf2ItBREGKMc8Q/jFQpxpJd6DxrkY1o2qhxnbQUEV7CYchrY1RRnc1
         DEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VthEHlZHr23DRmbr9MOlWVRr4kifLhZmHvZpURUh+Qc=;
        b=ul5528AdxC0Fs9aZDzW6UC07FLtBa9gs2QCfEG5TC3tpizX0wot6ewPXJC1kuKTX7b
         8XY3stm03DorqpFZPmMr21N4MkcpbcTy3OmYoDUVSAx0IzWYA7ZSy0Anh1SWmvCqxLJ/
         sNkPxTHwt1t6/pGKf1FhvTjAowA2qTnL10A5YEqjKj6BxDp9gmAGiyEkaWk/cSP4YQC5
         vdWjbzrriFvRZlBAmZoRrxjZjFA8Yu7LbMTck1NMgHGTEISo4G7rlBad09AQMunAQmzw
         zXcd3SWc9w5PcqHtiGLbks6McAgsKZ2UE5r1QG89qgL9Te/woM9fY8/bMgnejGRXIl2Y
         fEag==
X-Gm-Message-State: AFqh2kqSoHuLtme4yRrwnGITweMy31jq8jHNkNVpO/l/fstb1qdUqVBS
	TfeClD2k6BT0qT5XD+/JHBhLgm9WdAvqB35x
X-Google-Smtp-Source: AMrXdXv63DiZGTG9U+KezfkkFktdNgyn74Hdt9cDYBhB5nXhDjs3TznS1ByptEr8YPTquNWSJ3cfqA==
X-Received: by 2002:a0d:e787:0:b0:4fe:e703:109e with SMTP id q129-20020a0de787000000b004fee703109emr588296ywe.39.1674180089922;
        Thu, 19 Jan 2023 18:01:29 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id bq8-20020a05620a468800b00704c9015e68sm8322728qkb.116.2023.01.19.18.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 18:01:29 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 01/10] meta-*: mark layers as compatible with mickledore only
Date: Thu, 19 Jan 2023 21:01:21 -0500
Message-Id: <167418008361.2034362.6522350388921566665.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Jan 2023 02:01:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4302

On Thu, 12 Jan 2023 11:02:48 +0000, Ross Burton wrote:
> oe-core's master branch is diverging fron landgale and meta-arm will be
> following this, so drop compatibity with langdale in master so we're
> free to diverge too.

Applied, thanks!

[01/10] meta-*: mark layers as compatible with mickledore only
        commit: 146e9a5178ce6d1a6ae09a2649dc19364d4cca89
[02/10] arm: Add addpylib declaration
        commit: bba5bc91383fe8c72d88ccf6c1992d8106d7b4cf
[03/10] arm-toolchain: remove obsolete oe_import
        commit: d9db8b707541fe15baa3af7b94bff8777876776a
[04/10] CI: switch back to master
        commit: fdf95798bcc39174b4fafd995c1cd62ee21d6994
[05/10] CI: remove obsolete linux-yocto workarounds
        commit: 725281582aaf65f33c71274f7c86b75e646acacf
[06/10] Revert "CI: revert a meta-clang change which breaks pixman (thus, xserver)"
        commit: d3a0c441cde4a4dd3e3fd6d328c1244f7af076bf
[07/10] arm-bsp/fvp-base*: no need to remove rng-tools from openssh
        commit: 314b3b2eb73d3b91edef225a2cb5b15b9dc55162
[08/10] arm-bsp/fvp-baser-aemv8r64: Rebase u-boot patches onto v2022.10
        commit: a7d911310e0d4da4b2f6ca608bd9f528037da6dc
[09/10] arm-bsp/u-boot: corstone500: bump to 2022.10
        commit: 3f35573acbdc0a3aac9e81d794e14f849d40ee9e
[10/10] arm-bsp/u-boot: Corstone1000: bump to v2022.10
        commit: a51d4704ccd1737b8bc556bfe3e536142269bedc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

