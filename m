Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E515BC4332F
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 13:30:37 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.9935.1666359032042561831
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Oct 2022 06:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=pxFY0P2S;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id r19so1606328qtx.6
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 06:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5nnNWyBZ5hxeI01MHGvLUvDcWO0zCfXMhr0JuimDmA=;
        b=pxFY0P2SzZw86oCQDQ+zabbNgdl7T++w6elGyfy32UW0cBKA5fL1+UdNnkdG+pzJUJ
         eCdQJQfs+Yrrsr8NrK/q4BR+5tcWUXzrHyHOktmcIuhBCLzbKUDG60AVfWfvrPizNS9r
         X/vocpDRP1KV2ko4ZGQ6irAbv//++YCa4F5N0SVDrWywMxlkEAftXLyQE5lF6mq9XrzP
         YTqsyfWN6p4wZvRyAG/VR938SqikaMY6urHFdZ4rTIIhqR/nbt2sMJmey8O3pCjClQ40
         kAgCw7l0kknfUnBQGjY7PDa148Za+zSquF1ZT3uFxBsT/wRFAIpOmXOFAkmlkyjeJsZU
         ePpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l5nnNWyBZ5hxeI01MHGvLUvDcWO0zCfXMhr0JuimDmA=;
        b=4T/8cknjfB0I7Zeo/5lIxlnrQq7/qBnXPUo8ez5WDV4ZZhRnqqMtK5PetDvUJ3S5yR
         6/SwGAcPSLeVwMwVcVcEu4UXaNltz7HlWAz+SMihU0XAe+HfEUzw6iRYtqr4VpnxVlxN
         uePHIRQu9EtSXW7/0sf4VaKqpoRMccKiDWSOLDgtI3EQbC+DBPrekghNIlAIX1d2UhFb
         nMPbIpR5DrSPOkYU1kgVfxLNYP0ZoTEIN4qZ/KpiJ0M8anCzyvbF5oQB9u20T5sTWh+F
         sxXOZ2rGmrdUh/Wg25v2PCKB2VkQOA2lsVYqXIGxohsvK4DgFBnTRlqIY1d1/Cy+2/8P
         y7+A==
X-Gm-Message-State: ACrzQf3PApN2NodzJRoLMstChmGj3YEBpTHyOl6YZiH0MNrdXpgKliNr
	0Y57FS6/UNIolXX3gkJZkeVM0ShXOeWuoQ==
X-Google-Smtp-Source: AMsMyM4WXS7IcmjvNz5f7BgB6DDIyZwzWwaMpJF8ImaPzB4OFbDkWi+QI0lITC2y/kRBxe/4+hJmZA==
X-Received: by 2002:ac8:5c11:0:b0:39c:fd77:336d with SMTP id i17-20020ac85c11000000b0039cfd77336dmr12173767qti.479.1666359030609;
        Fri, 21 Oct 2022 06:30:30 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id j16-20020a05620a411000b006cf19068261sm9584718qko.116.2022.10.21.06.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 06:30:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: track langdale branch
Date: Thu, 20 Oct 2022 16:24:52 -0400
Message-Id: <166629749412.441713.5163326880978500630.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221020140238.6982-1-jon.mason@arm.com>
References: <20221020140238.6982-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Oct 2022 13:30:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3991

On Thu, 20 Oct 2022 10:02:38 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] CI: track langdale branch
      commit: f83c5ad19e27860f5709cea281cd4d4454f31f26

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

