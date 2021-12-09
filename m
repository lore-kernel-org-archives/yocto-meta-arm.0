Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6645C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:06:46 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.14141.1639069605374954066
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SSyyZITc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id b67so5447124qkg.6
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4EyivRDyK09Op8Tx9CpClMMO14CE0G5uwCpBiW5cxgE=;
        b=SSyyZITc5Uq+VZkpFxyGtndl0CGyw9+gPNIe4aBo3HMhTzwjUGJjdI8enGqVL1qPeK
         uMv3hfwIxqKcTurFvewYtV0ofn7JzT/+MIEeXf1RkzbR/FmvaQFDUl+VyLEAOOg9TEYU
         FnxuK/14yDnw2qR384YDDmDnA+TKVoFc1WKQgSnVivblD4ZrTAL4royQ5HKFtextmH/k
         8j7HTNw9pCkOie2Hw9WNPsk8ZNbadz32f5WpnMzmindIRPLeVOUN7+AAzQbtpb47BUrx
         4PwCR10IInDBij4HlGzTToGO9rSpPpo8NXTj0Qe5vNgEa99bl//uXM4Tq25vj6IF05VF
         GBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4EyivRDyK09Op8Tx9CpClMMO14CE0G5uwCpBiW5cxgE=;
        b=w+GW/N4gLrHBg3Qgt0vSKrBKyswCz0nUn/QfHcbROpnL2xS323GH7BxoKI55f5zjKd
         f3kQjNG3VzucDETBHSoJ6z7+MtOwBZwRxoAU+meH/WQp2So61sxv7Ps8kQbx6N8A/nG5
         kd82POKidfmJ0wxwG9CxnKVtOHj5nr85/ccIN30+59PFRkN8M/8KZ+D/IFDLkyoctroW
         smH7dF0FZ3z+VGTmh0ZdnB6hRo5ZFfAf62dswueRYhLkTg97w618uxviaIH2st8mI8L+
         KsaSOuHxVD+8rEfTffaMtyJtbpnKIH6K4w18vLecjoSVDvqK9/TmtJ3enw7+vUaiAL7Y
         rpBw==
X-Gm-Message-State: AOAM532cn3PZq7qsAknjZIovbwJj/CAZjtjQUTbOUYBbGoOvuMWLZDMX
	2Y0JSa/tuQUv3QYWCz7f8xiB7x6HIjxvHA==
X-Google-Smtp-Source: 
 ABdhPJwXdgF6OtuqEniDDXjcVM3PLsSRDE9MvxM2S9FkeRPcom8vwulGx402PiEJQDPMAnm+DUjUmQ==
X-Received: by 2002:a05:620a:461e:: with SMTP id
 br30mr14672814qkb.363.1639069604191;
        Thu, 09 Dec 2021 09:06:44 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id y11sm321942qta.6.2021.12.09.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:06:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/scp-firmware: remove redundant
 SGI-575-specific do_install
Date: Thu,  9 Dec 2021 12:06:36 -0500
Message-Id: <163906959603.25051.252690715368082078.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209132031.902428-1-ross.burton@arm.com>
References: <20211209132031.902428-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 17:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2586

On Thu, 9 Dec 2021 13:20:30 +0000, Ross Burton wrote:
> The base recipe can install the required files, so this is redundant.
> 
> 

Applied, thanks!

[1/2] arm-bsp/scp-firmware: remove redundant SGI-575-specific do_install
      commit: 0ee6e86680f9f2165920b41cb5fa23125555d6d3
[2/2] arm-bsp/scp-firmware: add comment to explain where a UUID is defined
      commit: dae1f79a933fba569dc96238a17553fd8798349b

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

