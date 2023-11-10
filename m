Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27080C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 15:05:26 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.29415.1699628723037206622
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 10 Nov 2023 07:05:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=qriLbQFp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.46, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6ce2fc858feso1152895a34.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 10 Nov 2023 07:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699628721; x=1700233521; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmgTWGJom3NQ0g1hvUjjZUU+RwzbHfklKv9L7ms/oMw=;
        b=qriLbQFpb3gVf+3Yd4zKhCxFmcSNUmPS+/Jj+xM+R8tV05ylBtDmWfP+GXiL4YlrQX
         dv0OEXoJmgIJ2wdsgnOcrdp7t8pM1U7KndUPmvgHQ4XjU7/tpJ07ilPki43+W8hvok3b
         q25F+/1+SIai7qNLp4v6c/uaxQbghuv9ZrC3gY5ikThTw+by59O6WHRVKZ2Jcx9lV3hm
         DzWXR95O65dBQ9MmdQ9nAV4nPDH3ZYQAxGo8+i2pYsZbKgpVkPY3RjiYmWh4U6E3yx0Y
         VmnxQSRMltt9uwVnWO0Zsr0/zbiLpFL2Gb7KdIcTgKv2Tzq23qQnjwM79lYOxWK8eeEW
         Ohcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699628721; x=1700233521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmgTWGJom3NQ0g1hvUjjZUU+RwzbHfklKv9L7ms/oMw=;
        b=wc2SBOWPQfaXG112x/jMRKlVBt7d3QUDtj+4Pi6+nA5zF/iGNZEhxfCgwzwjxE2fSH
         taoTh6e4wfjZVlNEj+rBo/cJFZbw8iiNWLhwaOOoT8AsgWFWjLe4Gv2jVCnTnyBCmIOK
         DFribKzLMTaILrAjAs9RrIwXAo1wmIqBqs4A0g9bwYQfHalt2g90WK/PoYBWNAbzt7sp
         sp3HQye96ua0y6NMb8SClmTXhKyoUi7qiHbTbByPWvaBYX8+vATWO2nEAqhXRdB1TkwT
         92XOgWeeFfMwKB0UDmrA4QvVIq8Cwa1WicrgGv+vhB1QIbfwEztlwCAeqxrR0MUlbgLs
         uRcw==
X-Gm-Message-State: AOJu0YzIOxLDdQbFrF9mAa9/xya5MCmUHUR2DmSf+Dnt+xyUiyPHPCes
	BmX/kFz7c1UxngH/MZGz9iw5HzH8caxqpkpmrmI=
X-Google-Smtp-Source: AGHT+IHI+mJw1OCIrcOQ1W6mFGCB2RxcpP0rTgN5b9wdaEcSJdAEHTQB9drLVBEl2zuprGYraOMZ8w==
X-Received: by 2002:a05:6830:1d87:b0:6c4:c6f5:3409 with SMTP id y7-20020a0568301d8700b006c4c6f53409mr9115631oti.2.1699628721244;
        Fri, 10 Nov 2023 07:05:21 -0800 (PST)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id jh11-20020a0562141fcb00b00674bdf8bfa9sm2947177qvb.29.2023.11.10.07.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 07:05:20 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-services: enable signaled handling interrupts for SPs
Date: Fri, 10 Nov 2023 10:03:15 -0500
Message-Id: <169962859923.2631724.13929699708631650297.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231109160357.1580350-1-emekcan.aras@arm.com>
References: <20231109160357.1580350-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 10 Nov 2023 15:05:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5224


On Thu, 09 Nov 2023 16:03:56 +0000, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Changes ns-interrupt-action for corstone1000. This will enable
> preemption in the SPs which is the default way to handle interrupts in
> trusted-firmware and optee documentation.
> 
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-services: enable signaled handling interrupts for SPs
      commit: 6d15f57733bb2228f93bbc489496039272b46dff

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

