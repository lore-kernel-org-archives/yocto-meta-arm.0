Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7DDC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 20:22:16 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.1995.1664569329207257118
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 13:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=7cOvty35;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id x18so3514772qkn.6
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 30 Sep 2022 13:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=lQUSnSJuKiq6Gg5aXkTrtcsq7M0mtmWTVtZOEL2LXr0=;
        b=7cOvty35DeJv+a3eD/hFcDa2+t1yx2PYXHJ/45hIuQIGkOup2z7itxDndZTprAVJxn
         YC1Svkluv+yo+OgBgwmhWxiiwugmxTB3v8ElkMsEQ2xLE+0erAyZWeM7MhpIRwogDYj6
         6Gk2VKmvpfCUlXiISAWDMmPNG05Hf0B+P0sG4XCfHoot9n8vi/21IG5MKBukvaBqEfAi
         3aPmDSGcGy/4/YHSgKcj/zN4wlv4PSAHqV1lK5PWCfktfmCSxLYKc68qKeUhIp+/ea4j
         MDdPXGJ5WvUZYARvsPcLe6ULLZ7lML0JnzDj8FWIerBtJcUBDRdSye2RsJG/ZAh7qX+n
         IJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=lQUSnSJuKiq6Gg5aXkTrtcsq7M0mtmWTVtZOEL2LXr0=;
        b=HuE8XHlW/i/VldIAe0MQ0YtwrrR2g2LH/5Sg3bI2N9wkzk82KHadhGINSIrhuyc3r+
         Au3uHpPMyNJSTRgkJa7AuquoZpFVXOHmXqI60LrZxxD/Dot6lQd1KTMJ/GlO8Az5RMlT
         VZFhsPYTjLeXsRzI5XSWUzPcnPo7qIO3Z6q8dmyYtZoh4s7rdf54y3Gf75t/WttikajW
         PZ3DuOOoGUzoUp+x3dnMBVMMKz7j7M8OP5vFA/x4ARHCpOH54Zav5Cqk2Wnxaz4SEzPn
         GCNT/qewZMoIojaFSpryv36AHvvWbEMdy49V3hzrtlWjShhhTgD910Y5JK7kJnhBBI00
         qE/w==
X-Gm-Message-State: ACrzQf19lBZI4QbXFQ1FVMcqRGe+zTPBWMzLehM/pQmUeH/nL8acEkba
	cB4xfcYsSF7zo+gkuqDZCNIO9J33kDZwhA==
X-Google-Smtp-Source: 
 AMsMyM5VmmuQLFROXUYUz4KKayCBl3M14gGPXNi+2cVVaVZ6B3sWdMpYX++/J2TX1vseV3EoXI5NpQ==
X-Received: by 2002:a05:620a:400f:b0:6be:971c:3749 with SMTP id
 h15-20020a05620a400f00b006be971c3749mr7291512qko.427.1664569327908;
        Fri, 30 Sep 2022 13:22:07 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 h8-20020a05620a400800b006bb9e4b96e6sm3568437qko.24.2022.09.30.13.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 13:22:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"adam.johnston@arm.com" <adam.johnston@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] arm-bsp/n1sdp: Update EDK2 and TF-A for N1SDP
Date: Fri, 30 Sep 2022 16:21:58 -0400
Message-Id: <166456932182.1898292.3389991454245498679.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220926103203.1196752-1-adam.johnston@arm.com>
References: <20220926103203.1196752-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 30 Sep 2022 20:22:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3884

On Mon, 26 Sep 2022 11:32:00 +0100, adam.johnston@arm.com wrote:
> Updates edk2, edk2-platforms to align with N1SDP-2022.06.22 release.
> Updates trusted-firmware-a version to align with the N1SDP refresh.
> Changes in trusted-firmware and edk2-platforms are co-dependent so have
> been submitted together.
> 
> Note: The EDK2 patches contain CRLF line endings which must be preserved
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/edk2-firmware: Update edk2/edk2-platforms versions for N1SDP
      commit: d7ef05a2fead4db55abbe77cfe5f44317ead2f6a
[2/3] arm-bsp/edk2-firmware: Add edk2-platforms patches for N1SDP
      commit: 4f6a200997f6c04eab8d733b1d9d64d149797139
[3/3] arm-bsp/trusted-firmware-a: Update TF-A version for N1SDP
      commit: 7f05bd643123b98aa4866eb0a74bcee94a34304f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

