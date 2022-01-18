Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C32CC433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 19:39:56 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.2030.1642534795152940805
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:39:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=sKBHYAFy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id t7so430291qvj.0
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JrqV3uWPY9OzE4RsWf4H3+QMr2vE8MmkyUsVupgfQtA=;
        b=sKBHYAFy086p2zygohiljeHJnP1VOLHt8Nm9WLmgJ9YdxcLsaH9VyFJJBSJHH+LmLK
         k/4ZtXYObLmPzKPxuTZTBcmo0GOU0BTHgovC1C9N5eFnicy1UYEVBvVZbd6/dDrJ9hHB
         7rTKdIvk5gfx/hpFnoQik2Zco/MT1I2wlcMDgkYpWWynU7l7HWB3BbD99OP7FG8+GzHP
         75MSgAlRf5Lvb7l2y8FFHaNd0SxH3CZaYm1BCnHoB4WYNqxB/qdPjt5hYHNs6VK1ELh0
         cILap1fPBKddjH2RptmBY+HUYV4PjXxrZFiyfU4ws2xYfQ+JU6RCIV1KE3w27Daq/s/o
         dV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JrqV3uWPY9OzE4RsWf4H3+QMr2vE8MmkyUsVupgfQtA=;
        b=Lz/UV/SD1rheeg5G8dBo8dVhziICzuAbfJKLwXOC69q4Qeb/yM937k2L+U+6i2JfsP
         lWjDwet1WVCW+1PF4mXMny/GvaDVgoLHJe2rJHumt/sV8D2Nwg+ocynLXg4SYShnr8rz
         lQr3BGBkZEKB1t2viC3k+DfHe7jWGArU28Yz3M1QLWQNCPBAUKePcjBzSaE+r/GHRCjE
         SQof8XZnrnLpKWeL00bf66wcjzclD0tjE5LneKpv1BwKPS/tPTMWwzDTcExNyGisK67g
         F7SLKNnVdP76OSmSKym1Qp1ySFoUFIQW9gusiwBBoJXyndlk+rdsYzunjvUbvDoO7XlI
         Tdaw==
X-Gm-Message-State: AOAM531knT7uJDhufsB1F80Hg7wd9SpitRNM4GEGcci9G5rcUi/2K4EN
	r57Sfkz399LujOTQQQuekp/zKitB9WMP/w==
X-Google-Smtp-Source: 
 ABdhPJyx23aLzVf1aQgOwyOxl9GLMlJXy11++NXOUkctSxp83GdI8L13O8CKYJJ3oauyKyH8m6mVDg==
X-Received: by 2002:a05:6214:1cc3:: with SMTP id
 g3mr24286086qvd.53.1642534794288;
        Tue, 18 Jan 2022 11:39:54 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:ff9b:992d:3671:5cb2])
        by smtp.gmail.com with ESMTPSA id
 m8sm4419664qkp.93.2022.01.18.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:39:54 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Anders Dellien <anders.dellien@arm.com>
Cc: Usama Arif <usama.arif@arm.com>
Subject: Re: [PATCH 1/3] arm-toolchain: Fetch prebuilt Android Clang,
 version r416183b
Date: Tue, 18 Jan 2022 14:39:41 -0500
Message-Id: <164253478336.1176449.11353389696083574137.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220117150002.16976-1-anders.dellien@arm.com>
References: <20220117150002.16976-1-anders.dellien@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 19:39:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2863

On Mon, 17 Jan 2022 15:00:00 +0000, Anders Dellien wrote:
> This Clang version is present in Android master
> (as of October 8, 2021)

Applied, thanks!

[1/3] arm-toolchain: Fetch prebuilt Android Clang, version r416183b
      commit: c4fb4f53cb3fcf87d08e93ae30f4a6734bd16c7b
[2/3] arm-toolchain: Support linux-arm64-ack build with Android Clang
      commit: db56f59865383eb91273570645b7063bbf391716
[3/3] arm: update Android common kernel and config
      commit: daa8388dadb4ebc24e3884ceb596cdb9f166ea25

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

