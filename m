Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8B71C30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 14:35:09 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web10.26047.1719930901666937407
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 07:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=D7VdAw/q;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.178, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-650866942aeso5761507b3.0
        for <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1719930900; x=1720535700; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N33YCYBzG9xnN8+5wqNWJyyUNVjl92zulS5cabnIYzk=;
        b=D7VdAw/qFYr8bNIXPVUMA4R0dgXY28AIMZI3HaGbli+XXqX4DOz+3G7Qh0Q2D6v3F2
         maJzX6U2dMzQaMWRZh8gMY2mIQwayhHX6i4DT7sM/bxhVRF6fDEQoG3Vo9fNFeeQqcPx
         HgcYihwWmbLYvli1t8HsPFIsZ5hiQqy7G5O8px4fKkM35N6EW/H2p6GkQAf58msieV4q
         v5HVlLkwF+i5WKdKu+Z2b1b3TffiZfpm3hLHbfKyy6Whp1BoobmbJePiXY9q/TK0L1Z3
         ObzsGjdv1cJ37ZPM3JeVBYybBPY3ko9B+6uAN0Fgt3c40ktJBXPDsHhw0jXHwHrUDa08
         ceBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719930900; x=1720535700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N33YCYBzG9xnN8+5wqNWJyyUNVjl92zulS5cabnIYzk=;
        b=KEITd0ypoyBaRee88pNNdws3O9r4QDVIo7bkYBnOBBqA9S1LOG2eTqVUfw3N44g1JY
         CIr0WmepfbqAL1sVHoHB0/Cqew80H8krxXdsZ/FEd2yeviivYOqYTD1Iv8G19SGtiEez
         gEb6yBrN9Bqe04iL68ZUVlT3E9jDNMLbs7R3fdEC7vSFs8TUwMGw8h3Foau4/LFp61MV
         Fkz1I1yWhlQdvb1rQGZEanQdvgLJ2EEnPLmWC1En4Gefa0EvFR7KahfSNI8OEsFZx31E
         VX4zQ1h8DAPUMNmhlLBn4Wc+YyPC+WBm1i9Swbs+C8NcmBkZBzclcMf99vfEGw56b1iN
         gJAQ==
X-Gm-Message-State: AOJu0Yy/swhVPRfMU64xEQ4xMrmAbuwLoVIavsHEn9PVO5f5LEBENRM5
	v1+sbioYMTA69SpVUas2ipR8QA//ZI7TzBO6RPZbEC5CyeHzSQrP9wGKyVdc8YYysb7hqVNfcy0
	=
X-Google-Smtp-Source: AGHT+IFvRRdfo4jp+sKG0KoEGK9vuCDlwbfYrh/K2Tzt7R2FDVfCIqmwZuQhKylDbS/bQhkf8KbQng==
X-Received: by 2002:a81:d206:0:b0:64a:956b:c063 with SMTP id 00721157ae682-64c73226bebmr85647627b3.39.1719930900547;
        Tue, 02 Jul 2024 07:35:00 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6508ff26e90sm1286037b3.64.2024.07.02.07.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jul 2024 07:34:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-systemready: WORKDIR to UNPACKDIR changes
Date: Tue,  2 Jul 2024 10:34:52 -0400
Message-Id: <171993089316.3773510.17816685380347486281.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240701131152.5620-1-jon.mason@arm.com>
References: <20240701131152.5620-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 14:35:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5856


On Mon, 01 Jul 2024 09:11:52 -0400, Jon Mason wrote:
> Recent upstream changes to what is acceptable use of WORKDIR have broken
> where the meta-arm-systemready recipes are expecting things to be.  Fix
> them to point to the correct location.
> 
> 

Applied, thanks!

[1/1] arm-systemready: WORKDIR to UNPACKDIR changes
      commit: 1d65894556c93c4cddc1a34f27b151e890ee061a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

