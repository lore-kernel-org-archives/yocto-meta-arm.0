Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.645.1580319651575391803
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 09:40:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=e6v/kKEq;
 spf=pass (domain: linaro.org, ip: 209.85.221.68, mailfrom: peter.griffin@linaro.org)
Received: by mail-wr1-f68.google.com with SMTP id z3so424042wru.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jan 2020 09:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=hgbJ0UobZKskQrMydRr94SIjCDk8Fw5HZ4uIumSAbpc=;
        b=e6v/kKEquXTm3Pf+B6suQwKKETqwckx1vfEoTt/pW/VRGMqJwh5QGruB1tFUyIHIUN
         aeVJV4BQYc9GzxSV8rqHZE0+zecLw3zkYz4jwA+AHsdr3tLUHk6E2pevLBFO+vUL13UD
         C5N+kKMJRfuKCxkD7iLmMa3BkHvy11Ph6pdG0UVRvKw22XBVEBR43Cr4E+avg3weHQxC
         NyXx2+YI/1nh5XfZ4d27D9YSr66yeqQ0ebInY6UW4MZfYq/EXOoV3Fwd2G5K+ueVO92q
         ZlMqewFurURC8M4Y5D5rptdTuncF82MJcml7nMuAcizQPHHmTq9qDaeKjBrqhEPhSJ7M
         TF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hgbJ0UobZKskQrMydRr94SIjCDk8Fw5HZ4uIumSAbpc=;
        b=UB66PYynLHWdh2i+Wsvt02aw1pcPJJfUwVCUMqvETLYcNLL2eQU4x71CME9m/Fq37G
         kmA9Xbmbaf1trGKfcNnF29hs0KltYYNyY8kTmaMJ4mMx/MPq5jAI5nRzYPBouDqRWofH
         qKLL25bsOcHrhVtbSJWYTJt1JHCR630D3q5ftpFTbYe+S4TTXROrn8yEHCoKFPGMGn+e
         ik9VsxbpOHJj4932kBmNSrc9XI8vcWUoBzxfhmmxML5d5ZcqNBh9F/jgegoo/abeQuFD
         G8M4wh59y+PELSlhEGPSFVvYoyYCnL9uYeIVxTMf2DjdwWPFmto3K/L63sFVW+fmQc4O
         kw0Q==
X-Gm-Message-State: APjAAAWjokeJQ+3GTmKyVvCp2E/+ji96KPSxdedfIRGjYc7Tg2cuFBh2
	uJ3hxR0b3uRAU7sGiimnyebA6LX0t7s=
X-Google-Smtp-Source: APXvYqzadcIsQdc4CrZhrOwqCeBCY5XCHti8lIALx2b1Klwjtrv80jtdT3rr3BWPb0BF+PqlbZCkZw==
X-Received: by 2002:adf:ebc1:: with SMTP id v1mr38218546wrn.351.1580319649833;
        Wed, 29 Jan 2020 09:40:49 -0800 (PST)
Return-Path: <peter.griffin@linaro.org>
Received: from localhost.localdomain (cpc89244-aztw30-2-0-cust4998.18-1.cable.virginm.net. [86.31.179.135])
        by smtp.gmail.com with ESMTPSA id y185sm3231525wmg.2.2020.01.29.09.40.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 29 Jan 2020 09:40:49 -0800 (PST)
From: peter.griffin@linaro.org
To: meta-arm@lists.yoctoproject.org,
	denis@denix.org,
	jon.mason@arm.com,
	raj.khem@gmail.com,
	nicolas.dechesne@linaro.org
Cc: joakim.bech@linaro.org,
	moorthy.baskaravenkatraman-sambamoorthy@linaro.org,
	alexandre.jutras@linaro.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/5] Add OP-TEE recipes to meta-arm layer
Date: Wed, 29 Jan 2020 17:38:40 +0000
Message-Id: <1580319525-32054-1-git-send-email-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.7.4

Hi Jon,

This patch series adds the OP-TEE recipes from meta-linaro
layer to the meta-arm layer which is the new home for generic
Arm architecture components.

Once these are merged, I will remove them and add a README
in meta-linaro.

Thanks,

Peter.

Peter Griffin (5):
  optee-client.bb: add optee client recipe and patches
  optee-os_git.bb: add optee-os recipe and patches
  optee-examples.bb: add recipe for optee examples
  optee-test_git.bb: add optee-test recipe & patches
  optee-test_git.bb: add python3 backport patch

 meta-arm/recipes-security/optee/optee-client.bb    | 35 +++++++++++
 .../optee/optee-client/tee-supplicant.service      | 10 ++++
 meta-arm/recipes-security/optee/optee-examples.bb  | 42 +++++++++++++
 ...1-allow-setting-sysroot-for-libgcc-lookup.patch | 13 ++++
 meta-arm/recipes-security/optee/optee-os_git.bb    | 69 ++++++++++++++++++++++
 .../0001-use-python3-instead-of-python.patch       | 48 +++++++++++++++
 meta-arm/recipes-security/optee/optee-test_git.bb  | 50 ++++++++++++++++
 7 files changed, 267 insertions(+)
 create mode 100644 meta-arm/recipes-security/optee/optee-client.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-client/tee-supplicant.service
 create mode 100644 meta-arm/recipes-security/optee/optee-examples.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-os/0001-allow-setting-sysroot-for-libgcc-lookup.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-os_git.bb
 create mode 100644 meta-arm/recipes-security/optee/optee-test/0001-use-python3-instead-of-python.patch
 create mode 100644 meta-arm/recipes-security/optee/optee-test_git.bb

-- 
2.7.4

