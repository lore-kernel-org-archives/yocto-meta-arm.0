Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A5AC7EE39
	for <webhook@archiver.kernel.org>; Sun, 29 Jun 2025 18:47:13 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.22468.1751222825223546928
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 29 Jun 2025 11:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DRuwVMK9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so8743346d6.1
        for <meta-arm@lists.yoctoproject.org>; Sun, 29 Jun 2025 11:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1751222824; x=1751827624; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw5V4RrYZP9XYnA4doizCq0kxz6OacHu2WAt/LsDpKs=;
        b=DRuwVMK9EUdJvV1IRfRFvkNpwwQWJH0MNlPpqm17C1TTlOdaRkMd6TQL4rgDBjtAc0
         h8+JuxRYajDss1oSyboVGeEKtnyTyLcIozQ7OQfFunLk2AfwAQ7ghfluci9ZsHHIQWHh
         E17tTHYOrrTJYDpsbb7EaG6ofN8JgQFS1zV8ocl1mGRQsDjFfVXAMOGOQLLHvN+1UzHg
         rhAFq76YhNvdcg1Wkng0YXBmx+Z+KhipDjoloHGfuvC3cAA43GK3c5KqT0CpF07ZJfrG
         h029qMI+ceAaF23H6049juYR8rl4XPDj20WNkZQl4C3strO+F7D3aApuO/7XR/tLog0U
         Va8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751222824; x=1751827624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pw5V4RrYZP9XYnA4doizCq0kxz6OacHu2WAt/LsDpKs=;
        b=A9UCxE5MbrOwK8jL2Bi18msa0yk2e74WRrEfB622aLHJja+OMpf3HaZR4wgjGSD0RV
         Lh31YBAu6APXBhk2DVq/t5jTlmvDboJv2D+7PeRt+IXktdg21w5LZyOUlunzVWhVJSnK
         eWmIM7HID9hgzz8O6fajbvxJJPtJneEoC8taLCKrFaCu1Xj7a5t7gv5Fky6yHotBn1zc
         nb3NWgnM+E4l6wbaAs2NIoDvQbJDoblhwRpNZB4TpknqZNm20dzXInlrsEGXqXQdJT2U
         xkm5LD4Mh1QyrXzzKtlNCNXqyvpzOGVv3AGwUiW5cBzHf+uK/LOrnYEuM5lO1/3ib4xA
         byGA==
X-Gm-Message-State: AOJu0Yxjf6z8hfO3Jgo5cei7NtdsI1xxyh+iH3klKIj3rXCUzCGkPd2n
	+YmIirR39ANbwBe0RpgwSocwJdpXOB/8c9idVfLFfvY8HMqGk/njp29PtIzuybA5/1/ifFuNFi7
	V904=
X-Gm-Gg: ASbGncvk1FNXYLf5kP9LfSSVWxlZT0h+FKKFbT4p+UCm7KUdvZ+/0QRJkO+Xz/z1oe+
	BEiD1FbFQl5fAA1w7vmJHo6muz/olfq3QkNUZHz3+oS40zVUo0Kzg8REjEpgTMeKiS1rYqxrSaN
	0DJzr07ieaMd2Er5qCEXEUjO8lw9ewj7zEoF6OWCmBCk/63dJCIF51GDnAX8Lsc+JevcqXYnmZR
	4cnhTvsLUx6a/Z8TGywBcgAc+EmQimI5BJH+3iARcHFXEPZN5yuo/goGdz5DTkEGrdwSJqwG2pE
	D5XMztpERSHPcAVi23uOYlB6elnWDSH+LjfZbjaKhJvLdDm6vlBM1w==
X-Google-Smtp-Source: AGHT+IE03tMppW3qnFpjdvbn9uyD8ow6cxDsR+fyHYw4Y4kObPWEAW4aWBCR12h88Dvu7+GBP0TngQ==
X-Received: by 2002:a05:6214:2606:b0:6fd:74d4:b6 with SMTP id 6a1803df08f44-70001c5db96mr184651976d6.28.1751222823981;
        Sun, 29 Jun 2025 11:47:03 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd772e3ca8sm54674906d6.71.2025.06.29.11.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 11:47:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Marcin Juszkiewicz <marcin-oe@juszkiewicz.com.pl>
Subject: Re: [PATCH v2 1/2] arm-bsp/sbsa-ref: modify network device and pflash for runqemu
Date: Sun, 29 Jun 2025 14:46:44 -0400
Message-Id: <175122280397.1667135.10799049438402998694.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250628153109.37423-1-jon.mason@arm.com>
References: <20250628153109.37423-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 29 Jun 2025 18:47:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6596


On Sat, 28 Jun 2025 11:31:08 -0400, Jon Mason wrote:
> The network device and pflash can be modified to more correctly emulate
> an actual system.
> 
> 

Applied, thanks!

[1/2] arm-bsp/sbsa-ref: modify network device and pflash for runqemu
      commit: bb60348450ad7ff0efbbdc7b99ae542ffea2df4d
[2/2] arm: WORKDIR fixes
      commit: eea748608c82df1c50d133c769279315e08dca5f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

