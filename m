Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0247C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:13:36 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.6433.1714659213221946496
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 May 2024 07:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=czoK7ugz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.177, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c6f785208dso1536867b6e.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 07:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1714659212; x=1715264012; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXigB7YzAIeT39r3Nb/GJoD24wS+4nGZ2L1lo9oCOFk=;
        b=czoK7ugzAzyXY8KX6+IT7fpiQmD+RFjL/FZaYs8tSnZGsh9XUGiGWhPLIRONbgCGPt
         w073o3veE5GfjXu3RYzBGBZcK12sfYh+72XyyEZIoCADlqylhqwYvUeEplYjSsjTb3QQ
         gGob8vNnNjKb+m79PFfG27UXHqrL/f1a+teS6eP/oRnlF+V9SE0t2VU01hSwSOuteknL
         xIDGb0kzmRQal+b9eI4MGBhQqVJ7hYqzeLKZ0DonVShmhTeRHWQitKmCLdEzzqD5zzdS
         OigJQBzVu5yAHwCNE/410P6jSjSY47z1xCNjB8ngLoVduS1kEcqNgkXuWrXnSJvV+2Ji
         fo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714659212; x=1715264012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXigB7YzAIeT39r3Nb/GJoD24wS+4nGZ2L1lo9oCOFk=;
        b=s2xNZByi95OP+taQlEl8WLSMOEtS6vtMJu5VTcqV3RNMV4f4HtcS0suECZPZffPPKQ
         JPZahCu4zmOPmLyO42fppTo6v44sncOJXuAgki0ohMgVUHttU+ScKhOSsVZz9Lgx8Wiz
         XrgqYUsIX443kJJEOWMo2JdBhfE9ilWoV8hO3PlJO/SsubI2lg2CgNzKsVN6j8kd3krc
         65XfVJGJmkMjxINaKfpERQr4fwz5Qi445nlsON6WUBDJZOUdkYkc5IuB4G2aFPPj995e
         RL1/9XdIoJXStJIjA5nhpcWRa0Zg+9Tly+vxuJJtdh74SjvaqiLzAIqj1++4JEKLx0+T
         vb2w==
X-Gm-Message-State: AOJu0YwgKUGKnCLz1K2USi1VvU4lkVoG+TGRSL1qYPohGEhW8Q4JHm8k
	JgqJDKeXYNTbl+7Dawaj/N9yoFnUU++inwrbOXhqOOFSte18WVxN8nk0QBX4lgXYCC0w4MOOqdc
	=
X-Google-Smtp-Source: AGHT+IE18H/ElNP4FPHBuF33y4TX5OckVzq2ORjCLSgvonur2VnKajHxcpTZqnrHs9JbPxLmMvMZQA==
X-Received: by 2002:a05:6808:1b13:b0:3c9:3d98:8098 with SMTP id bx19-20020a0568081b1300b003c93d988098mr6850188oib.45.1714659212359;
        Thu, 02 May 2024 07:13:32 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id s129-20020a1ff487000000b004daaeb20ab2sm143343vkh.4.2024.05.02.07.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 07:13:32 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	emekcan.aras@arm.com
Subject: Re: [PATCH 0/1] kas: corstone1000: include TS and PSA dependency for firmware image build
Date: Thu,  2 May 2024 10:13:13 -0400
Message-Id: <171465919489.3706898.14818795172951568296.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240502095158.2793406-1-emekcan.aras@arm.com>
References: <20240502095158.2793406-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 May 2024 14:13:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5686


On Thu, 02 May 2024 10:51:57 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Includes TS and PSA dependency for firmware image build
> 
> Emekcan Aras (1):
>   kas: corstone1000: include TS and PSA dependency for firmware image
>     build
> 
> [...]

Applied, thanks!

[1/1] kas: corstone1000: include TS and PSA dependency for firmware image build
      commit: 8aa8a1f17f5b64bc691544f989f04fc83df98adb

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

