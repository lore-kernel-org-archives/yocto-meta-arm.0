Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E26D6D22E
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 14:53:05 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43817.1766069581799033015
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 06:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=2HHw9W4r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.174, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4507605e19aso440604b6e.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 18 Dec 2025 06:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1766069581; x=1766674381; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=brazZuyKWsp6NYX7UAnVDWiJfcHUtOerI8C/F4HCIhE=;
        b=2HHw9W4rq6M2QxXFkf6LhIaOtuVD7P6/tSg1t2JpUzi/ds/9ryjrXUB4aAeDWcKtgs
         huTku3RrcQJ2wxbrgemcbsDXAcDpiPy6FMKrSaJsZtqT4lTwDevfGnUY/l8EA1HEu7EK
         Pem0j0mAZwBVK3o+YavL6ofivEW0ISMEzlVUYccjq7fRQ0g6PK8dd2iDx+N6qd0uVmDW
         jRbioUGNZugbzE5eVUy/mG6Funtxix4vp8uYVJ8VnMWEYk6h0JejN0qxsuyWMCcdaU+P
         NAAvdFiaqEgRoF/79U/oErxNT1aU3Bbu+IRJFoUVvGJ9gkvnv43lSXK9PQpUIEBUWIO8
         m6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766069581; x=1766674381;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=brazZuyKWsp6NYX7UAnVDWiJfcHUtOerI8C/F4HCIhE=;
        b=cNFcJao5bGQSeRFO4O/mslZNfmZCrriBpnaqlU74bHo/L8JLbGnDxMJGyJiYPtIqzI
         cadk1Gobw0TqQ7O8t07+w8+7R1hNBtsZgAVC2roC+jmfs+XqpIvHnPWltFucxaPwMgk7
         VTSMCcYa0PzpM2I0FP4CYj5RPoFiz3UKTt1vQviEnT6UNvy4dDrLmaOTvCJLCaS1j9J4
         JX/mEid16K5eIfooOFDE6WLJodlh5xUehVD0bguS5vd/Oo2oPjOuXqHf01+ksUP9PpEe
         ORk2Nh409IuRaD/bWb5Uv+jFSYqwFNDtFkCdnC0WMO9hNBDrBgv9uLB5hAJPtT6mw/D1
         wxcA==
X-Gm-Message-State: AOJu0Ywlr+9oGC5ToC112DeZYKUDdzCC0Db9/fIqUNAxHeyT92o3ufHG
	iG4y0BO2KU0+p0+6VPP1GymiM7nvKccHcZ0HcpVh3WLc6oj1cC/2HIUXNXdYi5AohA5hn4HUxWs
	Xg1rEwOIqQqFaz0g9DpiJ/+j6ekHM/fWEuPY4BrMu67HBLwJ6xrnuUw==
X-Gm-Gg: AY/fxX5U6XdX1iuVI80qFpYltr52Ek8FTCe58N8qsFhp2vx68XPs1RWHOHFeig74mwe
	PnzSy0PCqN7tzhCAJubqbbpHKvlgacKFj7T5iG7D7pdSFLjcWKpV+JBwr6E5gWJnLxkFc4inznR
	d5YqjtTnCaJPHZDu3smdYSg41xj8KekcU3Q/+vAAVfSQnYhs2gPtbMm9tcgwDpC41pUCNMW/aXk
	hPMqhlXOkl8APIEjKrXFxMnkdAsVFRc4SeEjrX5RRjdqE9HlQgUQorGNt6ArL3lVdhj04JZM4oI
	sw75FA==
X-Google-Smtp-Source: AGHT+IFdFXYZ3zvAvCuoDjnt/CDV0WfjME7C+jpwo3HgzXvMTboiBtJ8OxTRict2r3zzxRg3sdYDPKZmkpJL4LqR+lg=
X-Received: by 2002:a05:6808:219a:b0:450:d09a:8cc4 with SMTP id
 5614622812f47-455ac91a853mr8949984b6e.38.1766069580628; Thu, 18 Dec 2025
 06:53:00 -0800 (PST)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 18 Dec 2025 09:52:50 -0500
X-Gm-Features: AQt7F2pWCaTye-OB3Hol4GoODXxrt4Im8o51qbDva8yUgB9L8V4OXPQR0oUqQ2E
Message-ID: <CAPoiz9xcnkqA7QP1z7fdt3YpdJi7r7G=pZbwC9jnr5aA_A26LQ@mail.gmail.com>
Subject: Pending meta-arm whinlatter/5.3 tagged release
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Dec 2025 14:53:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6807

The Yocto Project has released whinlatter/5.3, as announced on the
Yocto Project mailing list:
https://lists.yoctoproject.org/g/yocto/message/362

We are planning to cut and publish the corresponding meta-arm
whinlatter/5.3 tagged release tomorrow.

The whinlatter branch on meta-arm has been available for some time and
has seen ongoing use and stabilization. Ahead of the tag being
created, this is a final call for any fixes or updates that you
believe should be included in the release.

If there has been anything merged on the meta-arm master branch since
the whinlatter fork that you would like to see included, please let us
know so that we can evaluate backporting it prior to tagging.

If there is anything you need in this release, please reply to the
list as soon as possible so we can evaluate inclusion before the tag
is created.

Thanks to everyone who has contributed to the branch so far.

Thanks,
Jon

