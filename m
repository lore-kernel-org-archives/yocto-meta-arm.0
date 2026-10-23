Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7192.1792762749134016129
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 06:39:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=gj3nDdYQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93e63ee7b4cso108163185a.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 06:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1792762748; x=1793367548; darn=lists.yoctoproject.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=riAkmRba8cYdGO0J2fq7/EbyO+Z5f2vMMuwBcjeOKeQ=;
        b=gj3nDdYQaVzCsjlneJpo3DKOA087CLuBmqE9wjUI6GtrwWECdS38X1Pom/H6sHjJ3B
         fGP9q7RBvoHIuC2Zsav4T5kYgXl2Wxqclc56SKrinwvDg19NsAHck/yZGG931JUePm9/
         878W7nNi2Ava2wg9PLY/rMVBVFSePEGvRa4XnJR7LTAK+VhMuIBsedZjibRObCf/C4mj
         cFNLXRtneweN/BAyySw4iIftUxU/0LqSaiBHmyC13ekRB3wwTXl1KaOw6TrG9L4zl0Uf
         U3vVTiscNNXF2Yh2dEtitP4laedQqpsJbQHjCP1a2G9VPIet/VJxqfz0CkINdr3GAmET
         Phdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762748; x=1793367548;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riAkmRba8cYdGO0J2fq7/EbyO+Z5f2vMMuwBcjeOKeQ=;
        b=tt1GANsA/C3QUUOGAkmdHbw7TEeg0MQ0oWvouRGqhJI/QU2xGlvdVHjXONcexHqi51
         ixnNycD9cM/8ZFHbciBwcA3qbCQPR/YDn+4xuyih4sxW8s7c21J3a430Nm3Ud/gdAVHS
         Zj8jbG4J1AUOceYlcl2TdvATM91/6rxqKb99uWhi0M2MBATbuMaV8BLdVyR2hadMnjeX
         5i91JJXbVcL+qmAX+zD89ImVahw720nfKvfx1sEiYfNP8dIuCU/LJksa0A4X+DkuOc+K
         5/AYY8qJhBL8PuFqghUpTHkFfeMMp0W9nS1UBUbSTjR7PnVywZt+YKjhsM7XmeLtgNQV
         JIdQ==
X-Gm-Message-State: AFq9FYLriIiuIytAEmSyMsbxy8J7AcwOGYkGjcU1c6m1yT4Al2VJEsw7
	r/wM898epCOt/9V9AgHfhiI/bRSJwpnFZ8xmyQf9NEjBny5pJc+IcXT+rCIFtX8SX88PL50Y9Uh
	MzGQ=
X-Gm-Gg: AYBFou25Svn+hZ+opUhBjYrdLe7GpnDgEVpB6SnuTH2q2/vibh5U4XrNeEG9zWYE2p3
	8ZLZ1S2SnC+GPmRiHqfnlV3Dncd7HUvOjlP+BawwHOU4uMGYuzy2Sr8OJ+eLGDVQmUhj4UO6Z5g
	fTUcDZsaVbFSJxhz91marSxroD0Ir9KeFFvR4oBSRvctabbU9cOdckpEjois36TuSduDyseXRu6
	okqPSHowgn5odjzTWQEr0YcSwNrViShxt+AdM5NH5dFGX0bZuU/2//pi8O/uqDFM6+CC6SEJvb+
	kdmlz6Y5rdGViLhOz66ZRPvtRUI/G7OVar69k7fSUvuY1IpNP41k8vkR9YL575iooDf5M9BfzcC
	d7Vqmnr6zIH6g1rNVFxYBRj18dbKxlYu6THLTLuWD4TpaLf1AB7vHfWG+6wY5PDTeKbGMu9OhIl
	Nd6LTDdMNNkEEuXFxiDgiYXEBtay/ycwT1PEbU+lMl/kbucJGSSeqF6Rdov3W7eLhONe7ZI+iTv
	4hs7DY0Kpd82CqnuJcUr8UMxUaJENNfoPxdcqBfGyDNnw==
X-Received: by 2002:a05:620a:6601:b0:93a:c102:1123 with SMTP id af79cd13be357-93f6f657866mr390388285a.15.1792762747659;
        Fri, 23 Oct 2026 06:39:07 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9402ee282bcsm21498985a.4.2026.10.23.06.39.06
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:39:07 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Fri, 23 Oct 2026 09:39:03 -0400
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm scarthgap update
Message-ID: <attjdwotxCjfkcO2@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 13:39:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7196

meta-arm has released an updated scarthgap support tag, 5.0.4.

This release contains 7 commits between 2026-05-21 and 2026-09-02.

Changes included in this release:

  313a5da55a8e optee-os: Fix CVE-2026-33317
  c4fd56386ee3 optee-os: Fix CVE-2026-33662
  23b572c40ea6 meta-arm-systemready/arm-systemready-linux-distros-fedora: remove
  045eb74bd9ab arm-bsp/firmware-image-juno: remove dependency on Linaro firmware archive
  95d3e1d08fb9 arm/optee: modify CVE_PRODUCT
  e5fdaa752624 arm/trusted-firmware-a: modify CVE_PRODUCT
  0a4b911d9fd6 arm/trusted-firmware-m: add CVE_PRODUCT

The release is available under the 5.0.4 and yocto-5.0.4 tags.
Both tags are GPG signed.

Thanks,
Jon
