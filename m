Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4159EC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 13:51:17 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.16085.1739368274226168483
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 12 Feb 2025 05:51:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=r1htfv+a;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c05c22d32aso577510285a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 12 Feb 2025 05:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1739368273; x=1739973073; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Yqx2pgGe3IgQ+Or4R3wzvo48fdOVUpGmHkzCaeunvw=;
        b=r1htfv+a5ZAbHl1gY0XaigVsssYxh5/X+I9sWv2ABBfzEpJ1cyDueiSjZuJmYmrXsZ
         OZfXYwWIoRaUCGZWntICasSLbbT2X8POPkkS+1LmFru/yfTrQre9kS1TnnFXEtxJjT9J
         4SgQzCbaz6Gb9bj38bE0JiPUaFLsB3nbdJO7fwFa5SIEguM3yQAPbAVzc15qI6uiUcl1
         6/1AyeUhqQ0k4FChD9mW1+lKLLbqtBgG8etHI9S/BfyzeusBcd3j9jZ/ftKTTsuL3nsm
         HgY+/QIkjx2VMkuYwx8F/0F5O7OdCDEoD3qoaO0KyvgX3VkkTsdxauK2tsycZ0HY7NpD
         /08Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739368273; x=1739973073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Yqx2pgGe3IgQ+Or4R3wzvo48fdOVUpGmHkzCaeunvw=;
        b=G94QoHKFnWRlk6OfTfe4yqrAxJsm+qy9lA0UI/yJy4ijOx0eNjZZA7gx6eWQ6m9Tz5
         /0+C7hWFbUrKx4hIL6pfOWrWykhzAatRI9ic1T/V3f5iNn7JYgRYCipxY5KozjLoH8aG
         e5JvhrvLNSnZty4cvlyoZrmHitsXMTGIVYr+W0Fc07Cf+ogDsB5cy6/i0zXjlpTuKPLh
         CeMFBER9FyjkmAwxNEhBTwGNGp1R9+yvVAc+a8kw3UmpaXpfx8amKrtQVD9GU523lZSS
         q+CGNjF+PK4oqGZzO+9kbfxuZ0BouiZsWTz9BNkqn1B91BBYWnpqfQSdJr6KSkyJ4M4c
         JNgA==
X-Gm-Message-State: AOJu0YzvKgd5F+xasH5zzwGEziu8hM6uCj9KV/yapTcSrWLfyXfKaRlV
	MHf+4MC4X5LD0TWkNb0/DoCmbrxr0TGA54nPhRBUeIAVEJnI5FoKoaqhsuZ6a0w8FHJZR6hsgBU
	=
X-Gm-Gg: ASbGnctg0QHW2AhwfwHkD7TUtlHHYVMs80yzH9jGdusX1uc+sp6hvYpp6204UTA+ret
	7+XMLv8FHjqntysz9QsNqbAQXEquUCDJT8GL5kfKAbdwWwTFS2Ot+RadjJFBClkKPWGQu3yPnrA
	3Z3UX+dr9ce9mExLg8LQhPGeP8cIg6UT34+zp4Ge1FdmIRK65F8+ep+IK89/T//EtpNbhB9pZT+
	3vzy/vC5PnDmfQswUuDtbADHVhvsJ+xPnH4zPyAzAmzIm4wMc6hU3BAVrDoJX9KOSZeasxi+eb3
	G16F0vk=
X-Google-Smtp-Source: AGHT+IFd2Z/BbB1Bts3b+juLvqeejZbsGD5dGJdE9BZMOX0qhicvZlPO01psktoUxXp7MFY2oubSPQ==
X-Received: by 2002:a05:620a:260d:b0:7c0:564b:61ab with SMTP id af79cd13be357-7c06fcc2758mr532224085a.37.1739368273036;
        Wed, 12 Feb 2025 05:51:13 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c041debdfbsm844018285a.10.2025.02.12.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:51:12 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/trusted-firmware-a: Add cot-dt2c
Date: Wed, 12 Feb 2025 08:50:27 -0500
Message-Id: <173936822860.3712262.8152511657906774851.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250122154504.42280-1-jon.mason@arm.com>
References: <20250122154504.42280-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 12 Feb 2025 13:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6369


On Wed, 22 Jan 2025 10:45:03 -0500, Jon Mason wrote:
> Platforms with GENERATE_COT need to either have COT_DESC_IN_DTB set or
> use cot-dt2c to generate it.  Add cot-dt2c from trusted-firmware-a
> sources and its python dependencies to enable this for those that need
> it.
> 
> Also, move all the relevant platforms in meta-arm-bsp to use 2.12
> 
> [...]

Applied, thanks!

[1/2] arm/trusted-firmware-a: Add cot-dt2c
      commit: f0f0be29a3ca8fa491fba1964d2a8335d896662a
[2/2] arm/trusted-firmware-a: Move 2.11 to meta-arm-bsp
      commit: 8a457932df115edbffb6d741baeb0a19c6853df6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

