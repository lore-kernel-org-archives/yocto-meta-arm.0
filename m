Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AD2CA0EFA
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 01:45:36 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web11.5639.1755827135538023413
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 21 Aug 2025 18:45:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=UNC42QiI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-70d7c7e9653so18943386d6.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 21 Aug 2025 18:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755827134; x=1756431934; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFdFMq/ayEVKtE1udDmF6uWxQkapIyOSxBi27LsPijU=;
        b=UNC42QiI+hh235iqAzylnJCdERVAaNQm9ZzKux57FZtEHUPQkdxbtmsUudthdIa+Bh
         izpFPsf0rI8sNM4nRzobT9EeAzzMXsuq/YS8Q20grX/FBpLEzgrD2FopbhQBwpqjZEZA
         67tWAr+eO7D/iFhZlkrsldL7KT/ymaf8LZsRtk0QsqwzFGweKx5V7Q1fLAQyRhhB2owH
         iSNVG7NDHgu5k8HxEiijE5L1613VVkC45uP5TwFI0OMPv630/56FPh/RcVz5p9Bx0JI7
         V4LcHsfrMtUQyBafaS1zDCMhCyh3tqWkVJB08Aqu+KjAP5/G+1y0yHFDWUbZ+6hwDvK5
         6xTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755827134; x=1756431934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFdFMq/ayEVKtE1udDmF6uWxQkapIyOSxBi27LsPijU=;
        b=FLFJsrmnSO7wOM0ODHCKvpx0I7qj+p0aO5tehAITuBGfedMgmUbauXEwMQdQq2tNQP
         bo/nzjhTMPqL6Lzlzq3GUR9Le7bgEOB7WKr55aKhHkCPMZzG0LoW5c5QsigxheLYxhSx
         ItcpjJToSam4toGsq8gieC90o2ueWhGgmHZSE6CkPKdApXlpWZwgpxQjQLTMDq7J/ijc
         TAWNulHFANS3plWohiCXEUYaA/oHrySUv7Pzfx7n+1fqkr0mozeeKoyUC4OWzDsGDNdj
         vlsJMdgN/S1dtf7cssH8Uu6gfR56HcJ6UmELCbTVtqqpZdqZ4ZXeiYbjxPLiEAReApfj
         AVlA==
X-Gm-Message-State: AOJu0YzF8TNRSHvorVfubXA2bHki3SX4KJsuNKfcXdiO00ghKArxfDqy
	Zso5YPxyGV9Z3fwta5oiSyTUwNl6C1JrsQxPKWeT0rW3fvo/75vBwlQCUyrdKwk1huQ8xaRIaKH
	wiAk=
X-Gm-Gg: ASbGnct9tdx2793SbMu46nKmuWtLnYetMm+MKdwrF4zRz4Ce2RHs2KXZ3cq7jtESfaR
	HYNx1E+0aTaW+5ZmU/zmaawVqG9SezZVY1RateVUJ2qsiNsoIQX1VEHmnKbWQVxdxj3Dd/1nfR3
	IbNFCxN4xke/QeGvqXRhslyi2YmcDsr2h87yW1xz3P2iLi19cZP95IQevD+W8pvve48mcqTPfpE
	HNe/aZAj3qOfybXKhDKiNu9a0v55MY8REtkh+OxvAXtZLy/1XqcE3zf2Li28xUB0hmxpisOWENk
	f92ImbpWWw+5+XDfDNU/p4mQhaKJnhLraaRnAiVFInm+v0Zgs3dWlA0HKG5ijAjPVPX4SBEPqdw
	86N6TO11krcptSFnJaf8HNs5w5wLOXbFD81U=
X-Google-Smtp-Source: AGHT+IHi3O1ZiSapZZBebgGEHHnsU1AlxyL/gJrZhbNXEKIoi/q88/CdRWHjEsuaG9EZkYVlppAvSA==
X-Received: by 2002:a05:6214:2aaf:b0:707:5273:9dd2 with SMTP id 6a1803df08f44-70d97236dcbmr22402936d6.45.1755827134402;
        Thu, 21 Aug 2025 18:45:34 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba902f4b2sm115947716d6.6.2025.08.21.18.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 18:45:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm/gn: disable uninitialized variable warning
Date: Thu, 21 Aug 2025 21:45:23 -0400
Message-Id: <175582712406.241153.8910086960164172598.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250820165424.20345-1-jon.mason@arm.com>
References: <20250820165424.20345-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 01:45:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6671


On Wed, 20 Aug 2025 12:54:23 -0400, Jon Mason wrote:
> An uninitialized variable warning is occurring when compiling gn.
> However, since Wall is being used in gn, this is being logged as an
> error.  Pass the no-error flag for this case to workaround this issue.
> 
> 

Applied, thanks!

[1/2] arm/gn: disable uninitialized variable warning
      commit: d8f0ab517b8bfe47a9e6d011711013877413cc4e
[2/2] arm/gn: update to the latest SHA
      commit: 6ec4a039a35c9f0947b82873b577b8a148473242

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

