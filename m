Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EF210AB83C
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 01:48:38 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63290.1774576109395309228
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 18:48:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LW92etHb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-89c6f61020cso26506516d6.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Mar 2026 18:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1774576108; x=1775180908; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+u6vGp6aW3zfqa316u+WlB+zzAz3PU1UPjj8yD10f4=;
        b=LW92etHbl9dM+/JX4RkSw9oCdaW912FdtyZ7CjqI64912NKl5rQQ++qeVIanwRffHS
         2jTzSsmK2R5GlY0/GC6CiTwR7D2Cfj12Srr95RVR/mqefgHsR83mFyvGpF3i/fGu3uuv
         ChGdybBpz/F0xprGHUIPIOeRrDBzpcPlwL9B7GVpASYcOsUeHmSr94NtaKzrsLHfSe3l
         lUYwy3AUK09LjzsVmhknPWS7bi3AuZf4wWy89H9NAqhPmb5ri+Cu6u/6tcJUbyuJyRjZ
         KFn4A8y8GIhV8fHIEhVz2kmwJmIkkB2q2nIICetC5/XE9VquUkE+JHlfynBUPOA0EbgB
         oyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774576108; x=1775180908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/+u6vGp6aW3zfqa316u+WlB+zzAz3PU1UPjj8yD10f4=;
        b=HsAYTiWSKA8WH+zTvUl17XJtzTFu8tR4yDC83cvWX0GEVbmS8w3OvBie+Ak1AsnHEh
         BESWIaEn0hsOzBEJeqPFKeibZrmLRJpbFvUIP3lyj13YYzf4NKcG4xgPiA/7EQPa6Ul3
         ngA/OtWLK3wyks+XUdpdHkmu1f4bh6LhcwVU+Oh1o3GgPTPPTKx4KcN4dLLdMEphJjUg
         AnJqFYACgtbhj5Pz205wNMv1tOw8xQK9Ur+MBMMr3mxQhFopWpwr1hCoWjQ5uSRpF6hi
         8pKT8iIkB1MpoU80COz6kMsyk/6/2KuLqbog0bG8wNUF3ceoDABrEx9nPmEdROjknsCZ
         UoeQ==
X-Gm-Message-State: AOJu0YzV5A79FmZJ97Qv7oR5jyH0xRUqZ5bVFYDOadrylKz4Q2GrmQ/h
	nXTRFQzprhXz1pG0lsaOCU7LSvq/ZVeAVfvQCFnZSeS6QqWoXxyi/vS2BChW8tHp3OHhAbWSyqZ
	xk2A=
X-Gm-Gg: ATEYQzxdrQsVYAWNICEC5lx0V9iZDVPzbYPqSA4Vg8TLbsiyDgC4aexMG6+n4+nS72I
	etw0lto8ynzNqp9QGV1msrPTIL9t8OFKKCfwXe2pzdqsc4etsWOMHDRRt3KVhyoqmUFDFEVDeig
	hnFbDhREU9N8roSBZauvUcEYdn+z9zN5h0XEVFbNHRr0wpHuTTSKe6jxxFSPZfShOad4hyY0xSM
	+GRi+TRge1qs8G+jaAt++gPg4MOYQVPq/aEI1aNBrP/rHTBOpuq0QwyUxfQbzEmXUzInOvejOLt
	t0KR99e/6JK6l4Tag7if6pBJkjN73IYxtG4lucQubZcjuA8qWIADVnvKvzVKJXQS01T82SjEONr
	MHfhgx55L9RDd+IjX02vv5qtg+kCPVMCl8d1jwq0iqn3n1K515SFefUMm+5aw6TEHElA/M1at/q
	R0ZNpl+u82JknxvH358aam9EY=
X-Received: by 2002:a05:6214:d81:b0:89c:866d:243d with SMTP id 6a1803df08f44-89cddf63383mr52272036d6.35.1774576108077;
        Thu, 26 Mar 2026 18:48:28 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89cd5855280sm37280096d6.1.2026.03.26.18.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 18:48:27 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Frazer Carsley <frazer.carsley@arm.com>
Subject: Re: [PATCH 0/2] Corstone1000 GPT Library
Date: Thu, 26 Mar 2026 21:48:19 -0400
Message-Id: <177457610090.1782542.16140448211501995250.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260326132857.1590256-1-frazer.carsley@arm.com>
References: <20260326132857.1590256-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 27 Mar 2026 01:48:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6976


On Thu, 26 Mar 2026 13:28:38 +0000, Frazer Carsley wrote:
> Adds to Corstone1000 the GPT library from TF-M. This is used to
> dynamically provision partitions, and remove them, during a firmware
> update. This way, there is no need to provision the second bank at build
> time.
> 
> All patches added in these commits are either submitted or backports,
> and can be removed when Corstone1000 upgrades to a version of TF-M that
> contains them.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/tf-m:cs1k: Add GPT library
      commit: 5fc4c29db9a0ac5eb937d008e8f5adbb52684480
[2/2] arm-bsp/tf-m:cs1k: modified mcuboot to use GPT library
      commit: 1778b36d666e5c990778bac8abe503175149b451

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

