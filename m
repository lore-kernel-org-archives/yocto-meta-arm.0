Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47A0EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 12:28:46 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.10156.1692793717544042684
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Aug 2023 05:28:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=WM4Ndgzv;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76da4437500so204790885a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 23 Aug 2023 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692793716; x=1693398516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TsF5QIk6caoT2wLDJTPIq2G2M7nFZlaJF+0/gMD5wE=;
        b=WM4NdgzvivqtJ02f+bOSL1RKHS8LhBx+013nuwqJxzHI+JRYD8R2q8ky6pDNYXHTRF
         M2P5UZeAvGFDPkb5uJfTGU/Fe/evY7y4Oen0ddlfZQnSvdf3V3sXbt5BPUafvNUuoFhF
         L8PkYbhOLhzh2c2VHArmbq8PwbVTEKhQ0qyvWUg1n72Z7o6fN37wnh469ORSQB+r4pf1
         SsRxLpEVieT1GALo2x7sRsW6dQV19CD00d6czsomKhrrXIH9RE2rmsmRBfPfCVAupn6y
         k/A/5FjLy0zbM9PRD7Pndq8OdoDKV1W0EHN7BKKXjHUJ2K142i4KJDRWa8W85kNwUJrG
         HZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692793716; x=1693398516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TsF5QIk6caoT2wLDJTPIq2G2M7nFZlaJF+0/gMD5wE=;
        b=Zz9TNjbVdedgI/izpyM8cs/e+msNgoTurMCjOKLdnSB6E8jROLMU7HZpp2Xm/aWNWE
         yhl4jikMnaAnHaF4KHXfUxJMbl4A7HlS3s03wR1OyvsitYGKK+EuT3ozVcXeEq7bCSc9
         aMXsdv8yU58aqfET4M+vQK311pU5Q8+v0mTZLEUdEKLtRXirSsM5m2X3zn1TuN+repZa
         2gqdh42Su48RZD5Qi3wIIT2YSOywLeDip4ZFxzZeM+d1UlmHVPzZWhG/ca0tVFfR4w3G
         Knhv/UvT/+frKq2FVLVI7LSLtZsceTJ2F+jfnVoExp3ufk1fwAyqGik4MSruZQ4yhGsq
         uYfQ==
X-Gm-Message-State: AOJu0YzEGauVIuTSJQ7dB/GUf/kFzmigrGBVevQXx6H1GIaAJ4A9JdxP
	dOxBTE+DIiYPvWfygl5RWKHEVqcVpi/znnEzCC8=
X-Google-Smtp-Source: AGHT+IGyFlqU5nRvtrpsIqzDH3DWepvyY6l88PEYmSv5j9FNPw3UC6V6KMe4sFuZkskOt2GlV8XYQw==
X-Received: by 2002:a05:620a:198a:b0:76c:cb3c:30c with SMTP id bm10-20020a05620a198a00b0076ccb3c030cmr12943755qkb.52.1692793716112;
        Wed, 23 Aug 2023 05:28:36 -0700 (PDT)
Received: from localhost ([136.54.45.9])
        by smtp.gmail.com with ESMTPSA id h12-20020a05620a10ac00b0076c96e571f3sm3900849qkk.26.2023.08.23.05.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 05:28:35 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/hafnium: update to v2.8
Date: Tue, 22 Aug 2023 18:15:09 -0400
Message-Id: <169274251128.85583.17774049772116274205.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230821194739.3647180-1-jon.mason@arm.com>
References: <20230821194739.3647180-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Aug 2023 12:28:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4989


On Mon, 21 Aug 2023 14:47:39 -0500, Jon Mason wrote:
> Update hafnium to v2.8, which allows updating tc1 to that version and
> remove the intermediate SHA.  It also allows for the removal of some
> backported patches.
> 
> 

Applied, thanks!

[1/1] arm/hafnium: update to v2.8
      commit: cacc36565a42be15907aaeb2ca29a7497d1735da

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

