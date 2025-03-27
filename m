Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA21AC36011
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:02:47 +0000 (UTC)
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web10.1616.1743094964223778283
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 10:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=JSe4cZQR;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.68, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-6e41e17645dso11153176d6.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Mar 2025 10:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1743094963; x=1743699763; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nbuDEBXbUTi6d/YmOAfFYTin0Q7zLiVfGzAIsj9TVI=;
        b=JSe4cZQRX1dOILXkn0JjPQKfnzGXcFvRkIkxOn1exnTsI6HXAWEzfyVPD4yD2Vt/LU
         IqU5k7GQwcyXxKnxJUNLj4jGieczSQznIri0TmvsLBi5gfLoZveC5eKN4e9e30LBTGEG
         AXYUVuxv0xeGzojXYu+HNPKekozk7kuhxMvL4ohpwsRT4Wzdy0ggziUdYP2qnu+tGzk0
         wDaGMDjyvhT+z6Eehlu2QHkmjY/fP0H4oUEjSTSt3onxLtREDheEolPgJClWOfZZHPVm
         Z1SEhAquFQJdf/e0x0bZOwkc3lLLcsziG/aw0ikqKpaKmsrqR/ZaaQG7vdA80mSgUFWk
         HUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743094963; x=1743699763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nbuDEBXbUTi6d/YmOAfFYTin0Q7zLiVfGzAIsj9TVI=;
        b=aNONLJCMLukn3MoRoiKmW5nh4q2W63gz+tCpnagXdiZ6VBWu66ZqQFuCB884vsf6qO
         Ge/zpn0x9/Fwu7PbV0dgabzdxtvoOpT9ZHskXJsUc5IAaYw11RdvJZV4PZ0x6LoWAgMR
         GkTQ8B0q/xJX85CBrnilW4pWwQvRcmVmOn02dqP8EcCGD09mHJvXSkSBRM/Kl2qqtbBL
         0J9CB5ybOXRJLS264yH+8yj0ST4moGln9exr+jyvxIqkgqhcrkqIci1Bpuy+zqQrt0k1
         jQ+jth7rz5iswV+dYDhgJwsPXvylwOnhkR92Giakex6ECW8uczI1hDp1jntlYX+yFrWe
         kEfA==
X-Gm-Message-State: AOJu0YyDTmd2O/KkdQkNsFaB5vxP+s/PFxmbZ3mWdZpMRBQJg2RGiDEt
	aC3CfSMPgxwtDv9Jy9iKMU6sYLWgtl8jNvAcwGpznUPQim+/f0EwK3yOTQKX3WEivo/f8Gcmgy2
	9jJn3
X-Gm-Gg: ASbGncslZpVP8mBgonO+6UZlf26X1C0WtgZ1VXbDXHEKD4NsGpnCqeOo38Q8MB9Sc3L
	es53/BLqknFZkpMQI98JyxG4iaT4eCNndyWN5Q8474+jq9wYYAkcgfS0qzrsjGjyA0SQYij/5c1
	r9ACM3O5tVM44jtLlFbGlbC3PtlkBHULuJRjw5tqw52B3/V4eNEbgHTQBw46w+cfPAG8bkh+Ml8
	T5byhJBJjs8nRYxQxXr5kePaIvBy4/L/BKhZoFq2N1IPcaRzL5iCk5ZohHeew9WYGywl3FTAT21
	WNS97DdK3ALiogYFxoB2oKtuWeSUmdWya6sH
X-Google-Smtp-Source: AGHT+IHsDmUoyDF9CZezKyfpm0cukRO1awXwaqWHYnVp+oEzyZwDjmYk9zVvJArLS+0aYyFmScdLWA==
X-Received: by 2002:a05:6214:21c2:b0:6e8:fa33:2962 with SMTP id 6a1803df08f44-6ed2384f963mr63768896d6.10.1743094962995;
        Thu, 27 Mar 2025 10:02:42 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eec9771b4dsm1179096d6.86.2025.03.27.10.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:02:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH][styhead] arm/fvp-base-a-aem: update SRC_URI
Date: Thu, 27 Mar 2025 13:02:30 -0400
Message-Id: <174309495119.3447541.2981392494924585393.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326131959.422592-1-ross.burton@arm.com>
References: <20250326131959.422592-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Mar 2025 17:02:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6419


On Wed, 26 Mar 2025 13:19:59 +0000, Ross Burton wrote:
> developer.arm.com has a reorganisation and whilst most paths have a
> redirect in place, the older FVP binaries did not.  Update the URL for
> this FVP to the new canonical URLs.
> 
> 

Applied, thanks!

[1/1] arm/fvp-base-a-aem: update SRC_URI
      commit: 97284c1c3e1d262305e5201d92c6efc2158dd0e3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

