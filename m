Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D542BCA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:34:01 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.18109.1757511232693790300
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 06:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ty7SZvDl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-81076e81a23so787518885a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 06:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1757511231; x=1758116031; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mzKbHQuT/5B750zUotcGqwZhZKZCDgnrrXuoxlrKQnE=;
        b=ty7SZvDlDLpiC60Dc9Xmo3se0t4WFEKj0LNiZnSd21dmaE25bQxlQQEx6e9dFFARWF
         AXQgTFZKaGUD+wB3wqiiFtTbZSuW1W3WUuTms+vp+nH+eb+emDZQOKjXwdkMKnAh7jhQ
         XPl8tbdu1XelW9Cgcq0xZs72ZDxk5fnjkvJlsWFdysvBhWAb+lBMrZ7eHn9FcCNCjy6u
         X/NhFONkP4g6I/tQwLKQKrdRqRZo64qfxgbWnhYf0pzMOHpE8a2c90RMq9sA6o/g5iZA
         LjVOPKIxWRTI22xkevjOxk8hD1AaMsxrYDtICGR426impu/ctxJq5M/Au/x+zXDH12sn
         7ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757511231; x=1758116031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mzKbHQuT/5B750zUotcGqwZhZKZCDgnrrXuoxlrKQnE=;
        b=wOmSVckrCUs3PXCCcPBXQKTNelOBTm7yR8mMOrNnZP8SS1U95Ru/IaSo8oTRvWlkyV
         gHxe0d7N3Qo7yeCNp13ZpWgePgMd/54qS/uMhkpUp9N6ZcTrAV8AAJn4Rp/e5U+eSBBD
         ExisEveiDUsRoLqX5cKFiv/sa+ldQ62/7LDJiq1GHbvwdcl52D8H2+0/jRfKhVFnn/hT
         1MD9vT3YySxJ7GTpbXblJWAFYEDmx6R2EetooG76u7ORT5fMNla0e1Nxe74kQI0q7j+D
         Lk7Hs7nH2uwvJ9VyfisQ58MsuJCWS6ZG+fOaaZUQuS3EO2k/ffClqEdA3ZjP6Yuv63ak
         IUMQ==
X-Gm-Message-State: AOJu0YyCidObZU6gcWTTAlp84bEHTdjQG8uMFGT9XckOyC/ZALHrucT3
	Xb28RzNS/OIBc8TvcezVV+UsnxS9SxdtSXB4J1n0DKSXEHJ/aL/Gc6WUkibt+PYuB0luCpaSdr6
	OHIc=
X-Gm-Gg: ASbGnctswHkPNpSRk3lshUYw0wiHHn9uK09V7M4Z6h5Td0ZoMXeZMCpPCQpDSIwj+sR
	VOnyZpZ5qWvry7kqQKuAjNy8bxqMfFzhBtF16vHiNXVODKzhwVJx2LUauaSpRgXmjioyfsC2Qqh
	Sc4yO1OAHyI7CbbCtZcVj8vOpo2hY1aaFxUafYShf2vcIx+q9OzqPlDf3fKSK4DuL3lgVUmJGO1
	rzzhTHsdR7yHtRCVCqwig2F6gVKKnKRpCs7B0Haz4RcfwA+qMoJBwVoaBw3tkTr765h/mpKyfEe
	jWL6A4OlvqZRIvy1iETh4U8+bhexmsxcpg3SBWP6on3EPWE5h5v6nnY9+Km0CcZbDIAtKmsptjL
	6p7eoz0h3Jj5vmw==
X-Google-Smtp-Source: AGHT+IHt+c8KnmWGAfpSW2ECeR7MMGX+urrQhJbf5EdOL9zMMwhPoSlqympK8HIYtEALxY7u7VIDTw==
X-Received: by 2002:a05:620a:4556:b0:81d:7e0c:3202 with SMTP id af79cd13be357-81d7e0c33e5mr397751185a.49.1757511231033;
        Wed, 10 Sep 2025 06:33:51 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b598cf901sm293947385a.23.2025.09.10.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:33:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/oeqa/optee.py: only run regression tests on qemu machines
Date: Wed, 10 Sep 2025 09:33:42 -0400
Message-Id: <175751122383.1941300.11815824029927881039.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250908130920.98624-1-jon.mason@arm.com>
References: <20250908130920.98624-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 10 Sep 2025 13:34:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6699


On Mon, 08 Sep 2025 09:09:20 -0400, Jon Mason wrote:
> The OP-TEE default tests are taking over 30 minutes, which is causing CI
> to overall take several hours.  For QEMU machines, reduce the tests to
> just be the regression tests, which reduces the CI time by over 30%.
> 
> 

Applied, thanks!

[1/1] arm/oeqa/optee.py: only run regression tests on qemu machines
      commit: 90b2ef142b3b227f8d3675b3ca8868f43e392d6d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

