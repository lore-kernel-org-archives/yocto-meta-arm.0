Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14F8CA0EEB
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 18:10:52 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.1016.1755886243497808397
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Aug 2025 11:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JZDJcPzw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-70ba7aa136fso22939476d6.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 11:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1755886242; x=1756491042; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTOXcQ2HwmqlB/51VNWfcmBgSrkYTf+p+d+r57HVBCw=;
        b=JZDJcPzwPQXKIcNWjKKqqcuQPiWSBRlJ2R3CDHODN2HUG+lVZ0TBRrhyEpK+oRahYQ
         VE0veojHhLvBs0WH+IhA5j/t+s+Bjs/BeS7lV+efehnzvID3b/OQlyDGbEhCJFiytu2j
         TIRUNgzaHvF/r4gZZA7Y8C7zQeUOS5L2+Iz+a/m+qoyGKtKtUyBg3fp0lkkQDtpLjQwe
         LLe6v/ilBUXhEubaqlpYFHNnNf2Uo4vINAAofSq/z7k/WOQNJLix03U/jDb9nsft1ao7
         H9g29rZ05aoUwIkgdAtTwyLFcTVHOWqsvtVrA/aiH6cLcZcnoQFD8eds5iStEfc+rsPe
         1QKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755886242; x=1756491042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTOXcQ2HwmqlB/51VNWfcmBgSrkYTf+p+d+r57HVBCw=;
        b=eStaWBTf/w/a+0mhVMfbeZuWl8RHO1xpwtDBslrVTRYKQ7sQYtOvflZeJZmPmCl/E0
         6kyoBEE6+oUoO3oawLeBqIyW9U6U7PyTHOjQCwsGyY7w61fOHjJl+NacbQu8WXoqHPwP
         r06AXeL6RG/qHdnzkGFlkG3rmO+wZJz1fpJpvu7H39Fp2P73Ypq5MZtaad29l9uyzjYC
         H2XAbkBrBN4m/8hFKyMu4k0GoLJn+clv0eXQp91eGJPDZejazrQd0LGgCtQbdebsK3Sw
         e2R67WmkVAk1hE4uhL0+xDjQczuDoxN8aGS8uZnsehLGJPTtghf9dgw89egTzwQlP1/R
         eSAA==
X-Gm-Message-State: AOJu0YzCeyo/6wAtHUINM2S2CJWT2HEJx66UsBe4ZH90wF4gKvkbJ0hl
	2R/Dk0SZylkkLonUvbFvm4h6jYA/7pDHVWOLkM1PhBaj2wmNEjmawgwiZm0Y5PTtXzgWHYMVYNP
	ZqIk=
X-Gm-Gg: ASbGncuqB/md6y35O17UcSnSjXc7xlS8JN7FyafgpN2KMtw5bdjNlL2Pp81JMGtN/90
	brGWNZZM8Eq0aJUu7x4BJzQqosfI13Q+NuMWYK+K3XSOWxKsSkUYTkLvrSwwl6+S2LQ0HL6XOWr
	uEbIAKEpPEfe702FpLMQ7i3LWwsjms/f7sOUgl8BBCRVUNFN6mpnabvTJcndlsLpAWPwJT9L24x
	x1V0mjchdV1sWh/z1zqd/KSams9ehJZbmNi3vn7R9KnPziI+Xyuk6llHD3+ihGKQhT29oIPAyVM
	e0ZWl11hstf+WlM5PboeEt3TcOgofddxyVfToryMnyg2W1CHCzaMYuDVKc9pRaCUfxhSCwgy+PU
	qV5pcZzm9Ckw1Ng==
X-Google-Smtp-Source: AGHT+IEHF15iOJlDDsKV01SdaxbA63VpoV3rkWGvzxiqhsS95nl/D1hTdCY56mZGcG24vJQOzmjNQQ==
X-Received: by 2002:a05:6214:3913:b0:707:76b6:20f8 with SMTP id 6a1803df08f44-70d971e9171mr47680506d6.31.1755886242300;
        Fri, 22 Aug 2025 11:10:42 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da714e746sm3138586d6.3.2025.08.22.11.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:10:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Cc: Norbert Kocsis <norbert.kocsis@arm.com>
Subject: Re: [PATCH 1/6] arm/trusted-services: Fix trusted-service license file paths
Date: Fri, 22 Aug 2025 11:58:20 -0400
Message-Id: <175587830010.1407857.15170621928370037920.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250822131813.93724-1-jon.mason@arm.com>
References: <20250822131813.93724-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Aug 2025 18:10:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6684


On Fri, 22 Aug 2025 09:18:08 -0400, Jon Mason wrote:
> Use UNPACKDIR instead of relative paths.
> 
> 

Applied, thanks!

[1/6] arm/trusted-services: Fix trusted-service license file paths
      commit: 9e6671a222acf1a3c9ff736fbcc784f092c624a1
[2/6] arm/gn: disable uninitialized variable warning
      commit: d8f0ab517b8bfe47a9e6d011711013877413cc4e
[3/6] arm/gn: update to the latest SHA
      commit: 6ec4a039a35c9f0947b82873b577b8a148473242
[4/6] arm/arch-armv9*: Fix PACKAGE_EXTRA_ARCHS reference
      commit: 05b2de0e7a9b71e61c16f7607546b846fb87648c
[5/6] arm-bsp/fvp-base: remove console workaround
      commit: 5442973e13df30e4cde0fab23b2dbafd03a3407d
[6/6] arm/optee-os: remove CFG_CORE_BTI from EXTRA_OEMAKE
      commit: e517e47d2ed44c79ecbdff2a0ef43fc62783b05f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

