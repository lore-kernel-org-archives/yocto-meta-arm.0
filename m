Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA31C19F29
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 21:37:53 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web11.25576.1658957871319689877
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vp40Aqo+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id c3so230781qko.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Jul 2022 14:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mucyUz72jwpG1xke3rP1hw2EOV7K7+5SaBfLA5Ck50I=;
        b=vp40Aqo+WlTO7qyBqpxY7e2zWobl8+Y79oqNv+dn3Lz42GzGJiI0L9dHTp7DEYCgWV
         IBENEhEVYyHcdnJOliqjvQXhvApxBImqBlKOWxog7ilyWkwKt3EQd1wLkGN+4HcU7/cO
         ocGsJGdg9HBw3EFRQZbt4c/SkWOath8rfsCSFDxz38cEDgtztA+Pcyoue5WBfcSTC3CN
         /oRC9cRNrzk6lxcxgvemoTzKRIhCj/PZydgTi725nJov5oQOwuKjprNEOsW0KrcIr0LS
         uk40vzd03ox7Ngv+hO+FI1QifOFg/Y0YPZjTcVjsClbeZVUwhxX7yL39fiR8zjjXQnHp
         H0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mucyUz72jwpG1xke3rP1hw2EOV7K7+5SaBfLA5Ck50I=;
        b=l6xfE+cQW5KBHwruMdRUQ/LqvpDFpIZ49Pi2IK9jq6tNycz7CzYiauQX8EPIzCaJKb
         /1RvqM/MezAF9uZc4ltrhMNKAsLeir6dt+C7VSV/sbUX0AD7CXsL91vCAgdu0a9z91Mw
         bDGmML6mrED8PL98gH+1T0RAH2PYEGZcq0WZGHF0a75wpUY8VyjVGdWLlmpuyJu/aeMm
         DpTsAj3ETYyDTEsVGlD5iUyX9wxPut/ovWkUNcjHnixk317tXs7vREPb3Ni2o5CBSsZm
         5wXf6Zxa+y3GYbKO5s5TORH2TPGDrsxlzI5sxgx+OrBsVABZ5/xrNeSrOEQ/TxR4z5G8
         CZRQ==
X-Gm-Message-State: AJIora9i1g/Iu4YELWsr9zj9DS3vH3fpFNIw3pPzSVsE1EKK/UT5Jwv3
	aUx2Si/5r6ksmCqqmJe2uXjO2AfjduTnxg==
X-Google-Smtp-Source: 
 AGRyM1tz4EqRthupkqGOW2PlQEuQJlo7jsTSV5aopJg5Q8z1jhtTx3moEBpeTE/FxejsQXN6CnGtqQ==
X-Received: by 2002:a05:620a:2a0d:b0:6b6:6c75:f050 with SMTP id
 o13-20020a05620a2a0d00b006b66c75f050mr7279650qkp.199.1658957869897;
        Wed, 27 Jul 2022 14:37:49 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 c12-20020a05620a164c00b006b5fbc3035bsm12830701qko.117.2022.07.27.14.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:37:49 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP (fix
 aborts)
Date: Wed, 27 Jul 2022 17:36:45 -0400
Message-Id: <165895780618.2769818.16297731169283151226.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220719125325.923598-1-adam.johnston@arm.com>
References: <20220719125325.923598-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Jul 2022 21:37:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3604

On Tue, 19 Jul 2022 13:53:24 +0100, adam.johnston@arm.com wrote:
> This patch, from N1SDP 2022-R1, adds support to parse NT_FW_CONFIG to EDK2
> platform code for the N1SDP. This is required to fix aborts seen when testing
> virtual memory after enabling trusted boot.
> 
> NT_FW_CONFIG DTB contains platform information passed by TF-A boot stage.
> This information is used for virtual memory map generation during PEI phase
> and passed on to DXE phase as a HOB, where it is used in
> ConfigurationManagerDxe.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/edk2-firmware: Add NT_FW_CONFIG to N1SDP to fix aborts when accessing virtual memory
      commit: 2b392ebd3cf92cf1f62b53a13774649ca6be11dd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

