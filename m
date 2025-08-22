Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911E0CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 01:45:46 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.5554.1755827145126171015
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 18:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2fqPgCKm;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4b133b24e69so7430001cf.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 Aug 2025 18:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755827144; x=1756431944; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LZyYCBvKih9rWGkij+K7zAAPqoRh4XkqLGw7eE9tUFE=;
        b=2fqPgCKm62PDdCQiL4oVz2fOcAvHok3TboRPMrM/hyUrcMY/kv0Pt3q0c7ubtShQBT
         b9Oto1CW9Ty4KvSgUuRp4lEOtWQCAYKELAzCsGYIvZn92G7LAhHea0xWLP/0v0qgObS0
         gLo3KDBVzBl7ljfjczn6Oef141601nji3S4z6JOwjIkY3M7i5rp9QhKBkBUKIMksQMFp
         n7R4K5lLfPa48g9o582ZUKW5wqZOdyaTjjc6lo5pxcm/xTqHQT1AxdjMsU3XwryDyLn/
         pSXWJ9nKIJ/NKGVBeR5IsWVIPRxv6+1urWmUJOgQJq5CqoJNBlDdh3g1wtQwqVbL4E+X
         Y4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755827144; x=1756431944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZyYCBvKih9rWGkij+K7zAAPqoRh4XkqLGw7eE9tUFE=;
        b=WqnF7RlIfpBDx9yRAb8xjuGsS2bD4VJDPXD7iZUr2saHOs7I5t9KAHafw6TeS2VTP2
         0mkWf1nv0gVlrcuNSqSOXvTOb9JG4WKSgi3aHsb2pXdmJcF197hXlB1dGmNlm9sS31aa
         k6KRoCNmmmRrU8A5S1LeZWQUvUqLe52i331uFE/yT/tBkD9pDMSUA8AvKFNdA2rT4ZQL
         bvBvlqGNH8zRJKOO/HrdAB/Qu6TOdCFtfd/j77QFFTkEUeaGljNfo0OfhT8eaMeJSrh9
         m78EVlCjkEmj1PdZyHHUIyxO4f71I9/zX8X5/e1WaN2AJ+n9l9aVvEpZtv50VencdmyK
         IRuQ==
X-Gm-Message-State: AOJu0YwXwv1RorjKUqfpK12+H9guNPWJDxPQ9ZUSH+PoqUh1lg29FCz6
	y2k/Uc+QMRW/g3dUafpuNKhTZJDsRauOTn4g6ydFac8cm3ooKh4bkHGaK6on5HnQkS0+kie5OSs
	Rd90=
X-Gm-Gg: ASbGncu2k4iecdgVbtH0XAe4Y9YU3mcJsEw/JZZcoPuQ3Ntxm+NUd33dT5I3Zb6B4PS
	ANPmysXVpAV3PvNVqW8yYJoLjWDKpyXuNMyx21d2HLbruou7RzmTOQMpMVHNALcE0MI/gUBA1vI
	yAO///DF0TFngdnRImcOo0Fx0y53VwabcQ8qkA/pWSIXAoEQ9lN4R93GybOM6waKEzfEDU7wXqk
	AU7+Ilaz+cKJGePO/k+PYD3BeCcxCXTXxtahJjSJ2lgO6GZraxOD6LIzcbAjUBn3qmsRO+vCg2S
	4Bsk9wew9vuTrj5p+8hj+Qor6NQyncqJwL52xAqrfZ8PemTSXfjy6OVnqJkZA3MBeoO7apuuMev
	fOIOesgx4wCNmIvIDCIlAqJSy
X-Google-Smtp-Source: AGHT+IGCkG2sSzdf1Cmxd3nK0+m2knY74vcX002Cane+WMORq8s4zxjCLaTam/tRB+IDbOZXx0bzYA==
X-Received: by 2002:a05:622a:198f:b0:4ae:6a54:b989 with SMTP id d75a77b69052e-4b2aaa3fd6bmr19145141cf.15.1755827143758;
        Thu, 21 Aug 2025 18:45:43 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11dc19631sm109748431cf.12.2025.08.21.18.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 18:45:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Norbert Kocsis <norbert.kocsis@arm.com>
Subject: Re: [PATCH 1/1] arm/trusted-services: Fix trusted-service license file paths
Date: Thu, 21 Aug 2025 21:45:24 -0400
Message-Id: <175582712406.241153.1907723222083511293.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250819133430.3226327-1-norbert.kocsis@arm.com>
References: <20250819133430.3226327-1-norbert.kocsis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 01:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6672


On Tue, 19 Aug 2025 15:34:30 +0200, Norbert Kocsis wrote:
> Use UNPACKDIR instead of relative paths.
> 
> 

Applied, thanks!

[1/1] arm/trusted-services: Fix trusted-service license file paths
      commit: 9e6671a222acf1a3c9ff736fbcc784f092c624a1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

