Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8429.1792765837747477421
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 23 Oct 2026 07:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=uA/aY9dC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-533778ab0bdso9415901cf.3
        for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1792765837; x=1793370637; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:content-type:mime-version:subject:to
         :message-id:date:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H7TYRyGQbRmg7DHsjSaE5Vle/KHPNGOzG+Q7EN5fGlQ=;
        b=uA/aY9dCB/lw7LyGZ1smRDvjnFVpPQgutpgS52Kyzo2lpvJin2gM2kBvmeaDyKoluo
         zBCitNvE7PMsMyHvTT7q+kpBDwqcYxHUqdy/RuNgusS0YYGk2ks3Tf54ZYT99+uFr4y6
         LuFrdaSwwDZp84qBFYFlNWF8mr9kAwCOntoR4p2y2km1JKd4+E/FM5DYlUBpQ/Xa8ve+
         9SzdVoKF0H2a+4ccjaSPVoJsogYxhmb+Kle79p7Ju5fif3UOZMYJaovE1zM8D0J4NycL
         tndR4jLKxt/dJrAS5RUCkQNzExpYM06fsubYoWXfrU5xaFjK+nlZT8A/Cb2l7Db+m7CB
         QJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765837; x=1793370637;
        h=content-transfer-encoding:content-type:mime-version:subject:to
         :message-id:date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H7TYRyGQbRmg7DHsjSaE5Vle/KHPNGOzG+Q7EN5fGlQ=;
        b=0TfM7aLTJCZ6E+Hrha4LGqjxgnTKw5jje0xRn3J49ROWz1dmwXFNIJIYv9tpGqsgXX
         hLgTOdlXSAssZ4PkHbRVQEmI0ijJaFW7aAv8sRQq0Ag4M0h1V7v7dGdj59P28HK7BkV0
         1BzHLZR7OxLXcWVmktKsWs+p3GdN+618oFAbSgROFtK6zGx9LmZfY/hK0cdnwevjimZm
         YdgiUo7USzV1wKVu6pry/AXUiiXClT9U+R5dGG9rk7BDFWCFTC4jAg/GCVlKyAejOs/g
         8BcqHNjQQ9BgZdpLVb+OMy54IF8S0rSCfwAyr4GySnSvTm3003XCwq2P2/QNo/uLtFXL
         vONw==
X-Gm-Message-State: AFq9FYKsMH14MASCnMwfjtDdj7PKjeJgD6T6Vpi0kpdU4WiuNrlT0+1O
	n8uFZfYsg/Tpy7uSF2tEcwFsRKg6c4KTCle5+lKeXWLnVSmwwZeaNLoPbH/wJriuXIAtrtaTCmY
	wPwk=
X-Gm-Gg: AYBFou1eDY23UTH5UDHhzlKlWfrO9ISHKC3dTDtwSyuan9DIldwGucSJjHuJPbteCo6
	tbZGVu6yw9R+aLn1apttjdLDpspmmchKJP48JneXJuA9kIJoUxjblFKSFNu/5Pwl6a36O7pHBe7
	BWhhCb8T9cyifZbFvHcl2gds+3TuslF2pELVOWdi+GkuNgd0Gf8zv8pv0LRoCNxvjRmYddvZ6cx
	eXs6D1hBrZZ3SRnOH25oYw2BFhk5weKzUwE9h5I78U4V1vRj9lxMzSr8liLIVP4P/V6kobs4Xg3
	PbT1dn9vaHT7UAGuZsFN3MTs1vmcs966GwiPNoZr2SlMUFWmDrCvwemM+RzMJftt+rNtYmK1cNj
	nvkmCBenyVn/7xQBpNv8dj9aeG8Up6pzIqdKt802aoHTZgBN6PftGF5dvuKFhrGRFqhg/ITw7xU
	2FGBgAQD7gwGaLt+bCCZW4hJ8bKvyAK8N4jfJguLyG3mvTMjnJaFJISqiK37j3Y3QX6URyuIyz9
	jCPhJtG38vZe3fH8whETwik3l4jy1fcUXdTgxEO7DKQnw==
X-Received: by 2002:a05:622a:1906:b0:536:766f:271d with SMTP id d75a77b69052e-536c259d23bmr32626491cf.51.1792765836281;
        Fri, 23 Oct 2026 07:30:36 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c4529e899sm2789106d6.37.2026.10.23.07.30.35
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:30:35 -0700 (PDT)
From: jdmason@kudzu.us
Date: Fri, 23 Oct 2026 10:30:35 -0400
Message-ID: <b5246e07f3f244c09d1180921dac9047.jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm blacksail release
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-arm@lists.yoctoproject.org>; Fri, 23 Oct 2026 14:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7198

meta-arm has released the blacksail support branch, tagged as 6.1.

This is not a Long Term Support (LTS) release. meta-arm generally aims
to follow the Yocto Project's release support lifecycle on a best-effort
basis. For non-LTS releases, this means approximately seven months of
limited maintenance, primarily consisting of bug fixes and security
fixes, with minimal CI testing.

The currently supported LTS branches are scarthgap and wrynose.

For more information about the Yocto Project's release lifecycle and LTS policy, see:
https://docs.yoctoproject.org/ref-manual/release-process.html

This release contains 89 commits since the previous Yocto Project release, 6.0.

The release is available under the 6.1 and yocto-6.1 tags.
Both tags are GPG signed.

Thanks,
The meta-arm team
