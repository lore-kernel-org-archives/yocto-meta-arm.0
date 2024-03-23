Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023BCC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 13:51:38 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web11.9074.1711201889120441397
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 23 Mar 2024 06:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ULXGcQAh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.210.48, mailfrom: jdmason@kudzu.us)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6e695b7391dso1476389a34.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 23 Mar 2024 06:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1711201888; x=1711806688; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6J4nPxahK67zHW1CTNzpGCMG0Hm/L1xjHsAi+e1TIc=;
        b=ULXGcQAhKv97PhH1sONfOtdZAs6xedsl/d4a+1/FSnlTF+13EdVvjia5GrxCaxvtr+
         03IXF1QA2sRwQ2laiV9WpLRhsU4vCeJ80yEIoFYKsVHUBId7X9dAb2/UPPKRs4o0RAbF
         24DBonAYY6rxDZBbr7/V+BHnDgkxv9LA0tebAOgBk0l5MK+nl7/vepppxmX49NlV0Hyc
         8xu+i3QTGSSQRsqgjVVpDTU3a6lm0AFLaV2Jb5H3CpODDW0+kc4dxReVu9zLKGr2rfsU
         oqefGBdaR4zKTsUhozmBzI1sH6Pu1PnyPjBkRZM2vUZph4eBS6gUxHvT01b7zpA/bld1
         R2lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711201888; x=1711806688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6J4nPxahK67zHW1CTNzpGCMG0Hm/L1xjHsAi+e1TIc=;
        b=wz7vyqym5yjwknrXTXnpXY2nZL5VnyxzPTW7XPo2SWOK2Qv4kHh72Jhj1QaKYsIsAS
         jugGdJ6k730hAP2ShT6CTfeW8q6Js95E7i1Bco+HD+0KDWQb6D1OLFwhbsvkatf8o01y
         ftQWskCCUCS9h8hU0/sRu4RZJVtu/nfmEDY7cz62eJGzwl4zz277pp9ZCcQmcytzuGf0
         I43hrXqQuNirPtiBoK/reA/sgiSRBKwYn8SvXNLGGyfOK3DKLY5XaCHVx/rHk3QG5c/m
         2E3GBjMCm78sD+duaK/t7ZWVKMxMuSROlXp5QPg7zZdTq3pLGLkIubs6P9LMXcjB/kzd
         7uFA==
X-Gm-Message-State: AOJu0Yz7Jy71tiJd2Oi7R4hUhXcFT4dSqvGgxGQzCvVjmPqm8V2oFLhX
	bhh9qGwuTKuZ3xtQN59doMj8ZcAveLKuXhe403aNW7hnZ6lhHNmuwyB0gzEUcsccsHLfNxMJS3s
	=
X-Google-Smtp-Source: AGHT+IEVYsFcqrsbWyc8qbUoH7j7siFJprJTvZzjg+v2WSSYLqXuYrjtwX7rkKK5u8Zl2YGrionh2Q==
X-Received: by 2002:a05:6808:1141:b0:3c3:9e0e:ac9a with SMTP id u1-20020a056808114100b003c39e0eac9amr3194296oiu.17.1711201888162;
        Sat, 23 Mar 2024 06:51:28 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id cm17-20020a05622a251100b0042f43a486c9sm799105qtb.77.2024.03.23.06.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 06:51:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/sbsa-acs: remove unreferenced patch
Date: Sat, 23 Mar 2024 09:51:08 -0400
Message-Id: <171120187054.2324488.3330495413552356546.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240322185600.11647-1-jon.mason@arm.com>
References: <20240322185600.11647-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 23 Mar 2024 13:51:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5485


On Fri, 22 Mar 2024 14:55:59 -0400, Jon Mason wrote:
> A patch was not removed when sbsa-acs was updated.  Remove and everyone
> is now happy.
> 
> 

Applied, thanks!

[1/2] arm/sbsa-acs: remove unreferenced patch
      commit: d36afba0cad112540aeec65a71cd94b6c0704328
[2/2] arm-toolchain: correct UPSTREAM_CHECK
      commit: f9bc290fc96f78fb415eddf6525d9c5757923264

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

