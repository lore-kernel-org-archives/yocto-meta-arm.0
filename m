Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12495.1794580185008749550
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 06:29:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20260707.gappssmtp.com header.s=20260707 header.b=Ni54vC6r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5363c8de563so19520031cf.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2026 06:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20260707.gappssmtp.com; s=20260707; t=1794580184; x=1795184984; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12F0ZC3ud8X/zUi6KEjhuJN3VM47fECCM5TnBVet1nA=;
        b=Ni54vC6rmh7JfL0CWi0EFYJKpS2sEogQ5T3Iup9WX6wB+tyPMYSEQ6hVI7myxhtyr5
         dbz8U2P/egV8UUQFAbfa+zfhEdNu3w4JNmZ+IviSEj2/4/q26blXlU04eb1W36ksdX2m
         L1pVatn23d90DDMWQBGKxCq9BX4+Aw8Zw/jmwvGXatNdc5SnnPRmxLdPyB23ZhqAX794
         OElov32JDQW3rs35leAue0uoMgWHSrHAqvEhSQgfRvATm1gteNtXSESDfupEPNwMKqMg
         DfBztgTAdScKmmBDDxT2Q9L8//zYNDklfbgVaCm3ErIpMCaU1QxMyaiOvl6AINJU9fyW
         qpjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580184; x=1795184984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12F0ZC3ud8X/zUi6KEjhuJN3VM47fECCM5TnBVet1nA=;
        b=m+TrW1QyoMoEMZtSoB03wrFQ/MVzb8ChoTc6487e3V98B+8TqjWKYj3+s05j02mXnb
         ZXazoLtqVi7IuqJXyGcCSFZOmNtKwIUW2alaoBerbfi+4uXmJGFtGh8R+45p/dVKDGw8
         ZhF4Fpj2+AtNIUr28jZFtNm0SazIcwNVCUrWHMf0IsvjclchO/Yxh/3pH7hUlSDHA/9o
         b2CQwpSdHOZ1iORpBEMxdbosd5P076XLMUVZokCz79EzMOJ/Fb2DtqK7CRIRmxhF7jNU
         amMMECH5q1Z/KCCrr7c/r5oXeJWkdD111Ffx6u3RE1Fa7pWgJtN2VAlEZBl/scK0NuQ5
         4nTA==
X-Gm-Message-State: APuU4Z9sG3zBvz/z6NhBwR5/ohBBcaS3DF2+Jrzut4GzGLZXIJUFPN6d
	+jBQUU3rGGkNk3/clkIi+K9JDoj67HIW/LBrWDwjgf9kovCrclFPiT2cNveGDj56QMbiDOXhcRB
	TYXM=
X-Gm-Gg: AYBFou13Xldi222YmTV346UwiVJqtbLYcLvTj/8CCImYvc0BiTzGFMY0sBzHgJFnBhH
	SM4jBv3iYCp+LYcfqSEFjMBY22INONlHptqOZmj/mtYlNa1KX5QiXVeUOg49dJ76MtfAjIglb1c
	v9tiVhkhadKaMiHIRFUvAc8eE8B6Ss1K0KwZ0lkRFZh2j65kCYqjCT2KaObgT3t4i4R/Brlj3Pu
	AyrwovAUhrol+WAK+KjVwZl0a4uOK+XtzFg/k/P0E2+zU7Pv/epfysaJIQKg1+AWgrd44yH1q0/
	ex9MTp8J+ukOstQxxMJT2bWsxzalzsowDAP2INeaP9VWqty0skBzKwx8RpEnI3WXfJ+CbjI2nkd
	YJwlBX/lRny2JCzvDcOta5ZvONX/0a1AkDDFdc6Hn7N7TnikVb5W8qKVExgrqWuERaGWqOHNQ7Q
	MVlLTwlgpTPn/NjDHWXHKsMhTYITeJrcsdKfLxyOJgvq6MB48dK9/ogzzASWxWOhPIEinrNbm6s
	2nBgsh3s3OVUWLtgwGjgdDDdex4I9u3rL4/SRoUCVUge13dnC9Oh+z0NRq1QMTESsoqJDccPNwo
	u5I+nLlWlZnPvpbzPP8=
X-Received: by 2002:ac8:5713:0:b0:545:c5ec:fa3f with SMTP id d75a77b69052e-55ac807a8a8mr40757991cf.45.1794580183773;
        Fri, 13 Nov 2026 06:29:43 -0800 (PST)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad0f07afesm19388461cf.16.2026.11.13.06.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:29:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: Re: [PATCH 0/2] corstone1000: Update 2026.11 blacksail release documentation
Date: Fri, 13 Nov 2026 09:29:29 -0500
Message-Id: <179458017085.2164217.14899649300999673256.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261112171420.1135204-1-harsimransingh.tungal@arm.com>
References: <20261112171420.1135204-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Fri, 13 Nov 2026 14:29:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7219


On Thu, 12 Nov 2026 17:14:16 +0000, Harsimran Singh Tungal wrote:
> Update the Corstone-1000 and Corstone-1000 A320 release documentation for the 2026.11 Blacksail release.
> Changes include:
> 
> - Add 2026.11 release notes and change logs for Corstone-1000.
> - Add 2026.11 release notes and change logs for Corstone-1000 A320.
> - Update Corstone-1000 A320 metadata revision information.
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/documentation: corstone1000: Update 2026.11 blacksail release documentation
      commit: c338c73b795c7eded29e216edb176d308c5bbd1f
[2/2] arm-bsp/documentation: corstone1000-a320: Update 2026.11 blacksail release documentation
      commit: cb64770a72e20f7d3338ac5dff26bb245f6fb2c3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>
