Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF53C25B48
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 01:32:44 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.164573.1698197555399291198
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 24 Oct 2023 18:32:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=M1gEBsNm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-41cc56255e3so27057171cf.3
        for <meta-arm@lists.yoctoproject.org>; Tue, 24 Oct 2023 18:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698197554; x=1698802354; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQ9dfoQ4GYsYqMWzYHZGD9jH+54m89XM09WUko5shCI=;
        b=M1gEBsNmqruwCoHN7phVMMp7QyyRSnuB7/0B56yI7ppmX4RukJR9kCm1jtup8W8jBL
         NT3Ul+91oyRW+rkqsHSBUnpcFw+dddTUPdFPcfemIGVoCtIPBxv2bJmq1y5Nja1JGEar
         05PRTfV/xQfFKtNy+bMgfQQsB4Hs2Tuajznn7y3KNBe57VMYv3NoviQoqgqJ5LaTorQi
         vUiavNXgR9XPeHahIuK/pI4RTq2T9+PyCLbOfi1qYZ4GLY8NpQOMC5FPkJGg9tzZWQg5
         929XYpa048YLNwRka5AkROzPqCQLFtuhfcnMz+rkoRs7R83DcZhP8XX4+c1nL7bIWidZ
         /S6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698197554; x=1698802354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ9dfoQ4GYsYqMWzYHZGD9jH+54m89XM09WUko5shCI=;
        b=NJR7N/tEmgVWVHPLZgwFhW8T9e4sozc/OJ0B8pboJwjRLr5d4E8GtDyV+YDffiCEJ3
         RfL6oJPB88WT7gHobguXmEbEXJnHmPedHxXJ3xCLhYFw1wmYirgG1vV8KbaTHIr0cFWV
         cnns9S8vcwWvIWdfaKaK5lyP3tgqk5BeJNfvm+bA4IMjY4qyd5a7paGULKtHyYAb9q7S
         pxtxOc/vZIN+g5gT+6EZJt0/BivkMut9cK7cdzXyiHBs6uQy53fj1RlmHPusiSKSht/j
         Z1thK3T+XHQHBq2v1r1PFLlVJjeDoLlpxruJ2X227qVorFny6J3D6DlPqm47glz53TMm
         ZCUQ==
X-Gm-Message-State: AOJu0YxKAoj1tzZUZVKngvoc0XmViRtxiFYNqT52WkyU8ZkX8G9DsZq7
	GCHx0sBnYrsae4ObpfiGEjj64LRTf5cS+cvE3rE=
X-Google-Smtp-Source: AGHT+IHxTRkxG4e1OX/5mtStkANhTafNwmCo2+I7nENEI3eev+nH7wsWRAavlzJT3mxEHH2WVqfXjg==
X-Received: by 2002:a05:622a:1653:b0:410:ab6d:54da with SMTP id y19-20020a05622a165300b00410ab6d54damr16924600qtj.16.1698197554038;
        Tue, 24 Oct 2023 18:32:34 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id 9-20020ac85949000000b0041cf5ec8b75sm2681534qtz.96.2023.10.24.18.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 18:32:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Debbie Martin <Debbie.Martin@arm.com>
Subject: Re: [PATCH 1/5] arm-bsp/u-boot: Divide the U-boot configuration by machine
Date: Tue, 24 Oct 2023 21:29:13 -0400
Message-Id: <169819735774.1892682.13970614656972340463.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231020123139.339204-1-Debbie.Martin@arm.com>
References: <20231020123139.339204-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 01:32:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5166


On Fri, 20 Oct 2023 13:31:35 +0100, Debbie Martin wrote:
> Have separate machine include files rather than multiple
> machine-specific settings in the same file.
> 
> 

Applied, thanks!

[1/5] arm-bsp/u-boot: Divide the U-boot configuration by machine
      commit: 6da032d8f0cb7f8468fa6c805f49be29a0c48de5

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

